import re

# 读取 Default.preset
with open(r'C:\Users\wangq\Scripts\windows\setup\Default.preset', 'r', encoding='utf-8') as f:
    content = f.read()

# 提取所有函数名（包括注释掉的）
# 匹配行首的函数调用（可能带 # 注释）
functions = set()

for line in content.split('\n'):
    line = line.strip()
    # 跳过纯注释行和空行
    if not line or line.startswith('###') or line.startswith('# Win') or line.startswith('# Author') or line.startswith('# Version') or line.startswith('# Source') or line.startswith('##########'):
        continue

    # 提取行中的函数名
    # 匹配 #? FunctionName 或 FunctionName
    matches = re.findall(r'(?:#\s*)?(\w+)', line)
    for match in matches:
        # 排除常见的非函数名
        if match not in {'Require', 'Privacy', 'Security', 'Network', 'Service', 'Tweaks', 'Explorer', 'Application', 'Auxiliary',
                         'Win', 'Server', 'Source', 'Author', 'Version', 'Initial', 'Script', 'Disassembler', 'Admin'}:
            functions.add(match)

# 排序并写入文件
sorted_functions = sorted(functions)
print(f"找到 {len(sorted_functions)} 个唯一函数名")

with open(r'C:\Users\wangq\Scripts\windows\setup\preset_functions.txt', 'w', encoding='utf-8') as f:
    for func in sorted_functions:
        f.write(func + '\n')

print("已写入 preset_functions.txt")
for func in sorted_functions:
    print(func)
