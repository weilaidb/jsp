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
#     print(paragraph.text)  #��ӡ�����������ı�

# document.add_paragraph(
#     'Add new paragraph', style='ListNumber'
# )    #����¶���

# document.add_paragraph(
#     u'�����б�Ԫ��1', style='List Number'
# )
# document.add_paragraph(
#     u'�����б�Ԫ��2', style='List Number'
# )


document.save('D:\\demo2.docx') #�����ĵ�



