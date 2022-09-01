package com.model2.mvc.service.purchase.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{
		
		///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///constructor
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
	public Purchase addPurchase(Purchase purchase) throws Exception {
//		return sqlSession.insert("PurchaseMapper.addPurchase",purchase);
		sqlSession.insert("PurchaseMapper.addPurchase",purchase);
		return purchase;
	}
	
	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase", tranNo);
	}
	
	public Purchase updatePurchase(Purchase purchase) throws Exception {
//		return sqlSession.update("PurchaseMapper.updatePurchase", purchase);
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
		return purchase;
	}
	
	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList",search);
	}
	
	public List<Purchase> getSaleList(Search search) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getSaleList",search);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		sqlSession.update("PurchaseMapper.updateTranCode",purchase);
	}
	
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", search);
	}
	
	public String makeCurrentPageSql(String sql, Search search) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getMakeCurrentPage", search);
	}

}
