import gdb
import re

def format_line_info(line_info):
    """
    从 GDB 的 `info line` 输出中提取信息并格式化为 `函数名 文件路径:行号` 的形式。
    
    Args:
        line_info (str): `info line` 的输出。
        
    Returns:
        str: 格式化后的字符串。
    """
    # 定义正则表达式，匹配行号、文件路径和函数名
    pattern = r'^Line (\d+) of "(.*?srcs/.*?)" starts at address .*<([^>]+)>'
    match = re.search(pattern, line_info)
    
    if match:
        line_number = match.group(1)
        file_path = match.group(2)
        function_name = match.group(3)
        # 组合为所需格式
        formatted_output = f"{function_name} {file_path}:{line_number}"
        return formatted_output
    else:
        print("Failed to match line information format.")
        return None

class AddressInfoCommand(gdb.Command):
    """Get line info for addresses in the input file and write back to the source file."""
    
    def __init__(self):
        super(AddressInfoCommand, self).__init__("addrinfo", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        """Read the input file, process it, and write back to the file."""
        try:
            # 读取输入文件
            with open(arg, 'r') as file:
                lines = file.readlines()
            
            # 定义正则表达式模式，匹配地址
            pattern = r'^(0x[0-9a-f]+)'
            output_lines = []
            count = 0
            for line in lines:
                # 使用正则表达式匹配
                count += 1
                matches = re.findall(pattern, line)
                
                for address in matches:
                    # 获取代码行信息
                    line_info = gdb.execute(f"info line *{address}", to_string=True).strip()
                    # print(f"Replacing address '{address}' with line info: '{line_info}'")
                    # 替换地址为行信息
                    line_info_polish = format_line_info(line_info)
                    if line_info_polish != None:
                        line = address + " " + line_info_polish + "\n"
                    else:
                        print(count)
                
                # 添加处理后的行到输出列表
                output_lines.append(line)

            # 将修改后的内容写回源文件
            with open(arg, 'w') as file:
                file.writelines(output_lines)
            
            print(f"Successfully updated {arg}.")

        except FileNotFoundError:
            print(f"File {arg} not found.")
        except Exception as e:
            print(f"An error occurred: {str(e)}")

# 注册命令
AddressInfoCommand()

# 加载命令
gdb.execute("set pagination off")  # 禁用分页以方便输出
