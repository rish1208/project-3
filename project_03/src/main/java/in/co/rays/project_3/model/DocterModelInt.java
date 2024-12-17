package in.co.rays.project_3.model;

import java.util.List;

import in.co.rays.project_3.dto.DocterDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.exception.DuplicateRecordException;

public interface DocterModelInt {

	
	
	public long add(DocterDTO dto)throws ApplicationException,DuplicateRecordException;
	public void delete(DocterDTO dto)throws ApplicationException;
	public void update(DocterDTO dto)throws ApplicationException,DuplicateRecordException;
	public DocterDTO findByPK(long pk)throws ApplicationException;
	public DocterDTO findByLogin(String login)throws ApplicationException;
	public List list()throws ApplicationException;
	public List list(int pageNo,int pageSize)throws ApplicationException;
	public List search(DocterDTO dto,int pageNo,int pageSize)throws ApplicationException;
	public List search(DocterDTO dto)throws ApplicationException;

	public List getRoles(DocterDTO dto)throws ApplicationException;
}
