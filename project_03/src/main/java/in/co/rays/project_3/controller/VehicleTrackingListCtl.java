package in.co.rays.project_3.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.rays.project_3.dto.BaseDTO;
import in.co.rays.project_3.dto.VehicleTrackingDTO;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.VehicleTrackingModelInt;
import in.co.rays.project_3.util.DataUtility;
import in.co.rays.project_3.util.PropertyReader;
import in.co.rays.project_3.util.ServletUtility;

@WebServlet(name = "VehicleTrackingListCtl", urlPatterns = { "/ctl/VehicleTrackingListCtl" })

public class VehicleTrackingListCtl extends BaseCtl {

	@Override
	protected void preload(HttpServletRequest request) {

		HashMap map = new HashMap();
		map.put("mp09", "mp09");
		map.put("mp08", "mp08");
		map.put("mp07", "mp07");
		map.put("mp06", "mp06");
		map.put("mp05", "mp05");

		request.setAttribute("vehicleId", map);
		super.preload(request);
	}

	@Override
	protected BaseDTO populateDTO(HttpServletRequest request) {
		VehicleTrackingDTO dto = new VehicleTrackingDTO();

		dto.setLat(DataUtility.getDouble(request.getParameter("lat")));
		dto.setLongitude(DataUtility.getDouble(request.getParameter("longitude")));
		dto.setVehicleId(DataUtility.getString(request.getParameter("vehicleId")));

		dto.setDate(DataUtility.getDate(request.getParameter("date")));

		populateBean(dto, request);
		return dto;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List list;
		List next;
		int pageNo = 1;
		int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));
		VehicleTrackingDTO dto = (VehicleTrackingDTO) populateDTO(request);

		VehicleTrackingModelInt model = ModelFactory.getInstance().getVehicleTrackingModel();
		try {
			list = model.search(dto, pageNo, pageSize);

			ArrayList a = (ArrayList<VehicleTrackingDTO>) list;

			next = model.search(dto, pageNo + 1, pageSize);
			ServletUtility.setList(list, request);
			if (list == null || list.size() == 0) {
				ServletUtility.setErrorMessage("No record found ", request);
			}
			if (next == null || next.size() == 0) {
				request.setAttribute("nextListSize", 0);

			} else {
				request.setAttribute("nextListSize", next.size());
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);
		} catch (ApplicationException e) {
			ServletUtility.handleException(e, request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List list = null;
		List next = null;
		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;
		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader.getValue("page.size")) : pageSize;
		VehicleTrackingDTO dto = (VehicleTrackingDTO) populateDTO(request);
		String op = DataUtility.getString(request.getParameter("operation"));

		String[] ids = request.getParameterValues("ids");
		VehicleTrackingModelInt model = ModelFactory.getInstance().getVehicleTrackingModel();
		try {

			if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op) || "Previous".equalsIgnoreCase(op)) {

				if (OP_SEARCH.equalsIgnoreCase(op)) {

					if (request.getParameter("lat").equals("") && request.getParameter("longitude").equals("") && request.getParameter("vehicleId").equals("") && request.getParameter("date").equals("")){
						
						ServletUtility.setErrorMessage("Fill atleast one search field", request);
						
					}
					pageNo = 1;
				} else if (OP_NEXT.equalsIgnoreCase(op)) {
					pageNo++;
				} else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
					pageNo--;
				}

			} else if (OP_NEW.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.VEHICLE_TRACKING_CTL, request, response);
				return;
			} else if (OP_RESET.equalsIgnoreCase(op)) {

				ServletUtility.redirect(ORSView.VEHICLE_TRACKING_LIST_CTL, request, response);
				return;
			} else if (OP_DELETE.equalsIgnoreCase(op)) {
				pageNo = 1;
				if (ids != null && ids.length > 0) {
					VehicleTrackingDTO deletedto = new VehicleTrackingDTO();
					for (String id : ids) {
						deletedto.setId(DataUtility.getLong(id));
						model.delete(deletedto);
						ServletUtility.setSuccessMessage("Data Deleted Successfully", request);
					}
				} else {
					ServletUtility.setErrorMessage("Select at least one record", request);
				}
			}
			if (OP_BACK.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.VEHICLE_TRACKING_LIST_CTL, request, response);
				return;
			}
			dto = (VehicleTrackingDTO) populateDTO(request);
			list = model.search(dto, pageNo, pageSize);

			ServletUtility.setDto(dto, request);
			next = model.search(dto, pageNo + 1, pageSize);

			ServletUtility.setList(list, request);
			ServletUtility.setList(list, request);
			if (list == null || list.size() == 0) {
				if (!OP_DELETE.equalsIgnoreCase(op)) {
					ServletUtility.setErrorMessage("No record found ", request);
				}
			}
			if (next == null || next.size() == 0) {
				request.setAttribute("nextListSize", 0);

			} else {
				request.setAttribute("nextListSize", next.size());
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		} catch (ApplicationException e) {
			ServletUtility.handleException(e, request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.VEHICLE_TRACKING_LIST_VIEW;
	}

}