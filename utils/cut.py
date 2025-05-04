import PyPDF2
import os
import argparse

def extract_pdf_pages(input_pdf_path, start_page, end_page):
    """
    Extracts a range of pages from a PDF file and saves them to a new file.

    Args:
        input_pdf_path (str): The path to the input PDF file.
        start_page (int): The starting page number (1-based index).
        end_page (int): The ending page number (1-based index).
    """
    if not os.path.exists(input_pdf_path):
        print(f"错误：输入文件不存在: {input_pdf_path}")
        return

    if start_page <= 0 or end_page <= 0:
        print("错误：页码必须是正整数。")
        return

    if start_page > end_page:
        print(f"错误：起始页码 ({start_page}) 不能大于终止页码 ({end_page})。")
        return

    try:
        reader = PyPDF2.PdfReader(input_pdf_path)
        num_pages = len(reader.pages)

        if start_page > num_pages or end_page > num_pages:
            print(f"错误：请求的页码范围 [{start_page}, {end_page}] 超出文档总页数 ({num_pages})。")
            return

        writer = PyPDF2.PdfWriter()

        # PyPDF2 uses 0-based indexing
        for i in range(start_page - 1, end_page):
            writer.add_page(reader.pages[i])

        # Construct output path
        base, ext = os.path.splitext(input_pdf_path)
        output_pdf_path = f"{base}_cut{ext}"

        with open(output_pdf_path, 'wb') as output_file:
            writer.write(output_file)

        print(f"成功提取页码 [{start_page}, {end_page}] 到: {output_pdf_path}")

    except Exception as e:
        print(f"处理 PDF 时发生错误: {e}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="从 PDF 文件中提取指定范围的页面。")
    parser.add_argument("input_pdf", help="输入的 PDF 文件路径")
    parser.add_argument("start_page", type=int, help="起始页码 (从 1 开始)")
    parser.add_argument("end_page", type=int, help="终止页码 (包含)")

    args = parser.parse_args()

    extract_pdf_pages(args.input_pdf, args.start_page, args.end_page)
