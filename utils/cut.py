# 20250308 by Claude 3.7 Sonnet
# 
# Usage:
# 
# # extract the first page
# python cut.py input.pdf output.pdf
#
# # extract the last page
# python cut.py --last input.pdf output.pdf
#
# # extract the specified page
# python cut.py --page=3 input.pdf output.pdf

import os
import sys
from PyPDF2 import PdfReader, PdfWriter

def extract_page(input_path, page_num=0, output_path=None):
    """
    提取PDF文件的指定页面并保存为新文件。
    
    参数:
    input_path -- 输入PDF文件的路径
    page_num -- 要提取的页面索引，从0开始计数（默认为0，即第一页）
    output_path -- 输出PDF文件的路径（如果为None，则自动生成）
    
    返回:
    output_path -- 输出文件的路径
    """
    if output_path is None:
        file_name, file_ext = os.path.splitext(input_path)
        output_path = f"{file_name}_page_{page_num+1}{file_ext}"

    try:
        reader = PdfReader(input_path)
        writer = PdfWriter()
        
        if 0 <= page_num < len(reader.pages):
            writer.add_page(reader.pages[page_num])
            
            with open(output_path, "wb") as output_file:
                writer.write(output_file)
            
            print(f"成功提取第{page_num+1}页并保存至 {output_path}")
            return output_path
        else:
            print(f"错误: 页码 {page_num+1} 超出范围，PDF共有 {len(reader.pages)} 页")
            return None
    except Exception as e:
        print(f"处理文件时出错: {e}")
        return None

def extract_first_page(input_path, output_path=None):
    """
    提取PDF文件的第一页并保存为新文件。
    
    参数:
    input_path -- 输入PDF文件的路径
    output_path -- 输出PDF文件的路径
    
    返回:
    output_path -- 输出文件的路径
    """
    return extract_page(input_path, 0, output_path)

def extract_last_page(input_path, output_path=None):
    """
    提取PDF文件的最后一页并保存为新文件。
    
    参数:
    input_path -- 输入PDF文件的路径
    output_path -- 输出PDF文件的路径
    
    返回:
    output_path -- 输出文件的路径
    """
    try:
        reader = PdfReader(input_path)
        last_page_index = len(reader.pages) - 1
        
        if last_page_index >= 0:
            return extract_page(input_path, last_page_index, output_path)
        else:
            print(f"错误: {input_path} 是空PDF文件")
            return None
    except Exception as e:
        print(f"处理文件时出错: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("用法: python cut.py [选项] 输入文件.pdf [输出文件.pdf]")
        print("选项:")
        print("  --first          提取第一页 (默认)")
        print("  --last           提取最后一页")
        print("  --page=NUM       提取第NUM页，从1开始计数")
        sys.exit(1)
    
    page_option = "--first"
    page_num = 0
    
    args = sys.argv[1:]
    if args[0].startswith("--"):
        page_option = args[0]
        args = args[1:]
    
    if len(args) < 1:
        print("错误: 未指定输入文件")
        sys.exit(1)
    
    input_pdf = args[0]
    output_pdf = args[1] if len(args) > 1 else None
    
    if page_option == "--first":
        extract_first_page(input_pdf, output_pdf)
    elif page_option == "--last":
        extract_last_page(input_pdf, output_pdf)
    elif page_option.startswith("--page="):
        try:
            page_num = int(page_option.split("=")[1]) - 1
            if page_num < 0:
                print("错误: 页码必须大于0")
                sys.exit(1)
            extract_page(input_pdf, page_num, output_pdf)
        except ValueError:
            print("错误: 无效的页码")
            sys.exit(1)
    else:
        print(f"错误: 未知选项 {page_option}")
        sys.exit(1)