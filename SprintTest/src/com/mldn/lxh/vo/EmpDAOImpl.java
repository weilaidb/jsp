package com.mldn.lxh.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mldn.lxh.vo.IEmpDAO;
import com.mldn.lxh.vo.Emp;

public class EmpDAOImpl implements IEmpDAO {
    private Connection conn = null;
    private PreparedStatement pstmst = null;

    public EmpDAOImpl(Connection conn) {
        this.conn = conn;
    }

    public Emp dosaveEmp(ResultSet rs) throws SQLException {
        Emp emp = new Emp();
        emp.setEmpno(rs.getInt(1));
        emp.setEname(rs.getString(2));
        emp.setJob(rs.getString(3));
        emp.setHiredate(rs.getDate(4));
        emp.setSal(rs.getFloat(5));
        return emp;
    }

    public boolean doCreate(Emp emp) throws Exception {
        boolean flag = false;
        String sql = "INSERT INTO emp(empno, ename, job, hiredate, sal) VALUES(?,?,?,?,?)";
        this.pstmst = this.conn.prepareStatement(sql);
        this.pstmst.setInt(1, emp.getEmpno());
        this.pstmst.setString(2, emp.getEname());
        this.pstmst.setString(3, emp.getJob());
        this.pstmst.setDate(4, new java.sql.Date(emp.getHiredate().getTime()));
        this.pstmst.setFloat(5, emp.getSal());
        if (this.pstmst.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmst.close();
        return flag;
    }

    public List<Emp> findAll(String keyWord) throws Exception {
        List<Emp> all = new ArrayList<Emp>();
//        if(keyWord.isEmpty())
//        {
//            return all;
//        }
        String sql = "SELECT empno, ename, job, hiredate, sal FROM emp WHERE ename LIKE ? OR job LIKE ?";
        this.pstmst = this.conn.prepareStatement(sql);
        this.pstmst.setString(1, "%" + keyWord + "%");
        this.pstmst.setString(2, "%" + keyWord + "%");
        ResultSet rs = this.pstmst.executeQuery();
        Emp emp = null;
        while (rs.next()) {
            emp = dosaveEmp(rs);
            all.add(emp);
        }
        this.pstmst.close();
        return all;
    }

    public Emp findById(int empno) throws Exception {
        Emp emp = null;
        String sql = "SELECT empno, ename, job, hiredate, sal FROM emp WHERE empno=?";
        this.pstmst = this.conn.prepareStatement(sql);
        this.pstmst.setInt(1, empno);
        ResultSet rs = this.pstmst.executeQuery();
        if (rs.next()) {
            emp = new Emp();
            emp = dosaveEmp(rs);
        }
        this.pstmst.close();
        return emp;
    }


}
