package tree;

public interface TreeviewElement {
	   public String getNodeName( );//�ý�������
	   public boolean canExpand();//�Ƿ��ܹ�չ��
	   public TreeviewElement[] getChildren();//���е�һ���ӽ��
	   public int getID();//����Ψһ��ʶ
}
