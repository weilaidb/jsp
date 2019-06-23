#!/bin/env python
# coding=gbk


from docx import Document
from docx.shared import Inches

document = Document('demo.docx')  #���ļ�demo.docx
for paragraph in document.paragraphs:
    print(paragraph.text)  #��ӡ�����������ı�

document.add_paragraph(
    'Add new paragraph', style='ListNumber'
)    #����¶���

document.save('demo.docx') #�����ĵ�

