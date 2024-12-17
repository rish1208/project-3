package in.co.rays.project_3.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import in.co.rays.project_3.dto.StockAnalysisDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;
import in.co.rays.project_3.util.HibDataSource;

public class StockAnalysisModelHibImp implements StockAnalysisModelInt {
	
	@Override
	public long add(StockAnalysisDTO dto) throws ApplicationException, DuplicateRecordException {
		
		 StockAnalysisDTO existDto = null;
			
			Session session = HibDataSource.getSession();
			Transaction tx = null;
			try {

				tx = session.beginTransaction();

				session.save(dto);

				dto.getId();
				tx.commit();
			} catch (HibernateException e) {
				e.printStackTrace();
				if (tx != null) {
					tx.rollback();

				}
				throw new ApplicationException("Exception in StockAnalysis Add " + e.getMessage());
			} finally {
				session.close();
			}


		return dto.getId();
	}

	@Override
	public void delete(StockAnalysisDTO dto) throws ApplicationException {

		
		Session session = null;
		Transaction tx = null;
		try {
			session = HibDataSource.getSession();
			tx = session.beginTransaction();
			session.delete(dto);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new ApplicationException("Exception in StockAnalysis Delete" + e.getMessage());
		} finally {
			session.close();
		}

	}

	@Override
	public void update(StockAnalysisDTO dto) throws ApplicationException, DuplicateRecordException {
		
		
		Session session = null;
		
		/*
		 * Transaction tx = null; StockAnalysisDTO exesistDto = findByLogin(dto.getLogin());
		 * 
		 * if (exesistDto != null && exesistDto.getId() != dto.getId()) { throw new
		 * DuplicateRecordException("Login id already exist"); }
		 * 
		 */		  Transaction tx = null;
		 

		try {
			session = HibDataSource.getSession();
			tx = session.beginTransaction();
			session.saveOrUpdate(dto);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new ApplicationException("Exception in StockAnalysis update" + e.getMessage());
		} finally {
			session.close();
		}

	}

	@Override
	public StockAnalysisDTO findByPK(long pk) throws ApplicationException {
		
		
		Session session = null;
		StockAnalysisDTO dto = null;
		try {
			session = HibDataSource.getSession();
			dto = (StockAnalysisDTO) session.get(StockAnalysisDTO.class, pk);

		} catch (HibernateException e) {
			throw new ApplicationException("Exception : Exception in getting Bank by pk");
		} finally {
			session.close();
		}

		return dto;
	}

	@Override
	public StockAnalysisDTO findByLogin(String login) throws ApplicationException {
		
		
		
		Session session = null;
		StockAnalysisDTO dto = null;
		try {
			session = HibDataSource.getSession();
			Criteria criteria = session.createCriteria(StockAnalysisDTO.class);
			criteria.add(Restrictions.eq("login", login));
			List list = criteria.list();
			if (list.size() == 1) {
				dto = (StockAnalysisDTO) list.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			throw new ApplicationException("Exception in getting StockAnalysis by Login " + e.getMessage());

		} finally {
			session.close();
		}

		return dto;
	}

	@Override
	public List list(int pageNo, int pageSize) throws ApplicationException {
		
		Session session = null;
		List list = null;
		try {
			session = HibDataSource.getSession();
			Criteria criteria = session.createCriteria(StockAnalysisDTO.class);
			if (pageSize > 0) {
				pageNo = (pageNo - 1) * pageSize;
				criteria.setFirstResult(pageNo);
				criteria.setMaxResults(pageSize);

			}
			list = criteria.list();

		} catch (HibernateException e) {
			throw new ApplicationException("Exception : Exception in  Banks list");
		} finally {
			session.close();
		}

		return list;
	}

	/*
	 * @Override public List list(int pageNo, int pageSize) throws
	 * ApplicationException { // TODO Auto-generated method stub return null; }
	 */
	@Override
	public List search(StockAnalysisDTO dto, int pageNo, int pageSize) throws ApplicationException {
		
		Session session = null;
		ArrayList<StockAnalysisDTO> list = null;
		try {
			session = HibDataSource.getSession();
			System.out.println("---------------------------------");
			Criteria criteria = session.createCriteria(StockAnalysisDTO.class);
			if (dto != null) {
				
				if (dto.getId() != null && dto.getId() > 0) {
					criteria.add(Restrictions.eq("id", dto.getId()));
				}
				
				  
				  if (dto.getStockSymbol() != null && dto.getStockSymbol().length() > 0) {
					  criteria.add(Restrictions.like("stockSymbol", dto.getStockSymbol() + "%"));
					  }
				  
				  
				  if (dto.getAnalysisType() != null && dto.getAnalysisType().length() > 0) {
					  criteria.add(Restrictions.like("analysisType", dto.getAnalysisType() + "%"));
					  }

			   if (dto.getStartDate() != null && dto.getStartDate().getTime() > 0) {
					criteria.add(Restrictions.eq("startDate", dto.getStartDate()));
				}
			   
			   if (dto.getEndDate() != null && dto.getEndDate().getTime() > 0) {
					criteria.add(Restrictions.eq("endDate", dto.getEndDate()));
				}
				
					
					
			}
					
					if (pageSize > 0) {
						pageNo = (pageNo - 1) * pageSize;
						criteria.setFirstResult(pageNo);
						criteria.setMaxResults(pageSize);
					}
					list = (ArrayList<StockAnalysisDTO>) criteria.list();
				} catch (HibernateException e) {
					throw new ApplicationException("Exception in StockAnalysis search");
				} finally {
					session.close();
				}

		
		return list;
	}

	@Override
	public List search(StockAnalysisDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return search(dto,0,0);
	}

	@Override
	public List getRoles(StockAnalysisDTO dto) throws ApplicationException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List list() throws ApplicationException {
		// TODO Auto-generated method stub
		return list(0,0);
	}

}
