package com.sist.book;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import java.awt.GridLayout;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.Vector;
public class OrderTestGUI extends JFrame {
	
	JTextField jtf_custid;
	JTable table;
	// 테이블의 제목 == '행머리'
	Vector colNames;
	// 실제데이터를 표현하는 객체
	Vector<Vector> rowData;
	
	OrdersDAO dao;
	
	public OrderTestGUI() {
		
		jtf_custid = new JTextField(10);
		
		//table을 생성하기위해서는 colNames, rowData가 생성되어 있어야한다
		colNames = new Vector();
		
		colNames.add("주문번호");
		colNames.add("고객번호");
		colNames.add("도서번호");
		colNames.add("구매금액");
		colNames.add("구매일자");
		
		rowData = new Vector<Vector>();
		table = new JTable(rowData, colNames);
		
		JScrollPane jsp = new JScrollPane(table);
		
		JButton btn = new JButton("검색");
		JPanel p = new JPanel();
		p.add(new JLabel("검색할 고객 번호를 입력하세요 : "));
		p.add(jtf_custid);
		p.add(btn);
		
		add(p, BorderLayout.NORTH);
		add(jsp, BorderLayout.CENTER);
		
		setSize(800, 600);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		btn.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				rowData.clear();
				int custid = Integer.parseInt(jtf_custid.getText());
				dao = new OrdersDAO();
				ArrayList<OrdersVO> list = dao.searchOrders(custid);
				
				for(OrdersVO vo : list) {
					Vector v = new Vector();
					v.add(vo.getOrderid());
					v.add(vo.getCustid());
					v.add(vo.getBookid());
					v.add(vo.getSaleprice());
					v.add(vo.getOrderdate());
					
					rowData.add(v);
				}
				table.updateUI();
			}});
	
	}
	
	public static void main(String[] args) {
		new OrderTestGUI();
	}

}
