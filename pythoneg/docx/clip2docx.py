#!/bin/env python
# coding=gbk

import docx

from docx import Document
from docx.shared import Inches
import pyperclip

document = Document()
# xa = pyperclip.paste()
xa = pyperclip.lazy_load_stub_paste()
# xa = pyperclip.determine_clipboard()

# xa = getCopyImg()
paragraph = document.add_paragraph(xa)

# for paragraph in document.paragraphs:
#     print(paragraph.text)  #打印各段落内容文本

# document.add_paragraph(
#     'Add new paragraph', style='ListNumber'
# )    #添加新段落

# document.add_paragraph(
#     u'有序列表元素1', style='List Number'
# )
# document.add_paragraph(
#     u'有序列表元素2', style='List Number'
# )


document.save('D:\\demo2.docx') #保存文档



