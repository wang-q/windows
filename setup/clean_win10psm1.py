import re

"""
清理 Win10.psm1 文件，只保留 preset_functions.txt 中列出的函数
用法: python clean_win10psm1.py
"""

# 读取 preset_functions.txt 中的函数名
with open(r'C:\Users\wangq\Scripts\windows\setup\preset_functions.txt', 'r', encoding='utf-8') as f:
    preset_funcs = set(f.read().strip().split('\n'))

# 过滤掉非函数名的项
exclude = {'Require', 'Privacy', 'Security', 'Network', 'Service', 'Tweaks', 'Explorer', 'Application', 'Auxiliary',
           'Win', 'Server', 'Source', 'Author', 'Version', 'Initial', 'Script', 'Disassembler'}
preset_funcs = preset_funcs - exclude

print(f"Preset 中有 {len(preset_funcs)} 个函数")

# 读取原始 Win10.psm1
with open(r'C:\Users\wangq\Scripts\windows\setup\Win10-Initial-Setup-Script\Win10.psm1.original', 'r', encoding='utf-8') as f:
    lines = f.readlines()

# 找到所有函数的位置
func_info = []  # (func_name, start_line_idx, end_line_idx)
i = 0
while i < len(lines):
    line = lines[i]
    match = re.match(r'^Function\s+(\w+)', line)
    if match:
        func_name = match.group(1)
        start_idx = i

        # 找到函数结束（匹配的 }）
        brace_count = 1
        j = i + 1
        while j < len(lines) and brace_count > 0:
            brace_count += lines[j].count('{')
            brace_count -= lines[j].count('}')
            j += 1
        end_idx = j  # 不包含
        func_info.append((func_name, start_idx, end_idx))
        i = j
    else:
        i += 1

print(f"找到 {len(func_info)} 个函数")

# 找出需要删除的函数
funcs_to_remove = [(name, start, end) for name, start, end in func_info if name not in preset_funcs]
print(f"需要删除 {len(funcs_to_remove)} 个函数")

# 创建一个集合，存储要删除的行号
lines_to_remove = set()
for name, start, end in funcs_to_remove:
    # 同时删除函数前面的注释
    comment_start = start
    k = start - 1
    while k >= 0:
        stripped = lines[k].strip()
        if stripped.startswith('#') or stripped == '':
            comment_start = k
            k -= 1
        else:
            break

    for line_idx in range(comment_start, end):
        lines_to_remove.add(line_idx)

# 构建结果
result = []
for i, line in enumerate(lines):
    if i not in lines_to_remove:
        result.append(line)

# 写入文件
with open(r'C:\Users\wangq\Scripts\windows\setup\Win10-Initial-Setup-Script\Win10.psm1', 'w', encoding='utf-8') as f:
    f.writelines(result)

print(f"完成！删除了 {len(lines_to_remove)} 行")
