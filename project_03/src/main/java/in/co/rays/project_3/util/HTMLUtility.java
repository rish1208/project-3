
package in.co.rays.project_3.util;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import in.co.rays.project_3.dto.DropdownList;

/**
 * HTML Utility class to produce HTML contents like Dropdown List.
 * 
 * @author Deepak Pandey
 *
 */
public class HTMLUtility {

	/**
	 * Create HTML SELECT list from MAP paramters values v
	 * 
	 * @param name
	 * @param selectedVal
	 * @param map
	 * @return
	 */

	/*
	 * public static String getList(String name, String selectedVal, HashMap<String,
	 * String> map) {
	 * 
	 * StringBuffer sb = new StringBuffer( "<select class='form-control' name='" +
	 * name + "'>");
	 * 
	 * 
	 * Set<String> keys = map.keySet(); String val = null; boolean select =true;
	 * 
	 * if(select){ sb.append("<option selected-value=''---->"); } for (String key :
	 * keys) { val = map.get(key); if (key.trim().equals(selectedVal)) {
	 * sb.append("<option selected value='" + key + "'>" + val + "</option>"); }
	 * else { sb.append("<option value='" + key + "'>" + val + "</option>"); } }
	 * sb.append("</select>"); return sb.toString(); }
	 */
	public static String getList(String name, String selectedVal, HashMap<String, String> map) {

		StringBuffer sb = new StringBuffer("<select class='form-control' name='" + name + "'>");

		Set<String> keys = map.keySet();
		String val = null;
		boolean select = true;
		if (select) {

			sb.append("<option class='dropdown-item' selected value=''>------Select a " + name + "--------</option>");
		}

		for (String key : keys) {
			val = map.get(key);
			if (key.trim().equals(selectedVal)) {
				sb.append("<option selected value='" + val + "'>" + val + "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}

		sb.append("</select>");
		System.out.println("get list 1=========" + sb.toString());

		return sb.toString();
	}

	public static String getList1(String name, String selectedVal, Map<Integer, String> map) {

		System.out.println(selectedVal + "hhhhhhhhhhhhhhhiiiiiiiiiiiiiiiiiiiiii--====");

		StringBuilder sb = new StringBuilder("<select class='form-control' name='" + name + "'>");

		Set<Integer> keys = map.keySet();
		String val = null;
		boolean select = true;
		if (select) {

			// Add placeholder option
			sb.append(
					"<option class='dropdown-item' selected value=''>------Select a---- " + name + "--------</option>");

		}

		for (Integer key : keys) {
			val = map.get(key);
			// Convert key to String for comparison and value attribute
			String keyString = key.toString();
			System.out.println(keyString + "12345678900000000000----===");

			if (keyString.trim().equals(selectedVal)) {
				System.out.println(selectedVal + "12345677778899900--====");
				// Mark the option as selected if it matches the selectedVal
				sb.append("<option selected value='" + key + "'>" + val + "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}

		sb.append("</select>");
		System.out.println("get list 1=========" + sb.toString());

		return sb.toString();
	}

	public static String getList3(String name, String selectedVal, Map<Integer, String> map) {
		StringBuilder sb = new StringBuilder("<select class='form-control' name='" + name + "'>");

		// Add placeholder option
		sb.append("<option value=''>------Select a " + name + "--------</option>");

		for (Map.Entry<Integer, String> entry : map.entrySet()) {
			Integer key = entry.getKey();
			String value = entry.getValue();
			String keyString = key.toString();

			// Determine if this option should be selected
			boolean isSelected = keyString.equals(selectedVal);

			// Append the option element
			sb.append("<option value='" + value + "'" + (isSelected ? " selected" : "") + ">" + value + "</option>");
			System.out.println(value + "====---------==============================");
		}

		sb.append("</select>");
		System.out.println("get list 1=========" + sb.toString());

		return sb.toString();
	}

	/**
	 * Create HTML SELECT List from List parameter
	 * 
	 * @param name
	 * @param selectedVal
	 * @param list
	 * @return
	 */
	/*
	 * public static String getList(String name, String selectedVal, List list) {
	 * 
	 * Collections.sort(list);
	 * 
	 * List<DropDownListBean> dd = (List<DropDownListBean>) list;
	 * 
	 * StringBuffer sb = new StringBuffer( "<select class='form-control' name='" +
	 * name + "'>");
	 * 
	 * String key = null; String val = null;
	 * 
	 * for (DropDownListBean obj : dd) { key = obj.getKey(); val = obj.getValue();
	 * boolean select = true; if(select){
	 * sb.append("<option selected-value=''---->"); } if
	 * (key.trim().equals(selectedVal)) { sb.append("<option selected value='" + key
	 * + "'>" + val + "</option>"); } else { sb.append("<option value='" + key +
	 * "'>" + val + "</option>"); } } sb.append("</select>"); return sb.toString();
	 * }
	 */
	public static String getList(String name, String selectedVal, List list) {

		Collections.sort(list);
		StringBuffer sb = new StringBuffer(
				"<select class='form-control' style='border: 2px solid #8080803b;' class='form-control' name='" + name
						+ "'>");

		boolean select = true;
		if (select) {

			sb.append(
					"<option class='dropdown-item' style='border: 2px solid #8080803b;' selected value=''>------Select a "
							+ name + "---------</option>");
		}

		List<DropdownList> dd = (List<DropdownList>) list;

		// StringBuffer sb = new StringBuffer( "<select style='width: 163px; height:
		// 23px;' class='form-control' name='" + name + "'>");

		String key = null;
		String val = null;

		for (DropdownList obj : dd) {
			key = obj.getKey();
			val = obj.getValue();

			if (key.trim().equals(selectedVal)) {
				sb.append("<option selected value='" + key + "'>" + val + "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}
		sb.append("</select>");
		System.out.println("get list 2=========" + sb.toString());
		return sb.toString();
	}

	/*
	 * public static String getList(String name, String selectedVal, HashMap<String,
	 * String> map, boolean select) {
	 * 
	 * StringBuffer sb = new StringBuffer( "<select class='form-control' name='" +
	 * name + "'>");
	 * 
	 * Set<String> keys = map.keySet(); String val = null;
	 * 
	 * if (select) {
	 * 
	 * sb.append("<option selected value=''> --Select-- </option>"); }
	 * 
	 * for (String key : keys) { val = map.get(key); if
	 * (key.trim().equals(selectedVal)) { sb.append("<option selected value='" + key
	 * + "'>" + val + "</option>"); } else { sb.append("<option value='" + key +
	 * "'>" + val + "</option>"); } } sb.append("</select>"); return sb.toString();
	 * }
	 * 
	 */
	public static String getList(String name, String selectedVal, HashMap<String, String> map, boolean select) {

		StringBuffer sb = new StringBuffer(
				"<select style=\"width:240 px;\"; class='form-control' name='" + name + "'>");

		Set<String> keys = map.keySet();
		String val = null;

		if (select) {

			sb.append("<option selected value=''> --Select-- </option>");
		}

		for (String key : keys) {
			val = map.get(key);
			if (key.trim().equals(selectedVal)) {
				sb.append("<option selected value='" + key + "'>" + val + "</option>");
			} else {
				sb.append("<option value='" + key + "'>" + val + "</option>");
			}
		}
		sb.append("</select>");
		System.out.println("get list 3=========" + sb.toString());
		return sb.toString();
	}

	public static String getInputErrorMessages(HttpServletRequest request) {

		Enumeration<String> e = request.getAttributeNames();

		StringBuffer sb = new StringBuffer("<UL>");
		String name = null;

		while (e.hasMoreElements()) {
			name = e.nextElement();
			if (name.startsWith("error.")) {
				sb.append("<LI class='error'>" + request.getAttribute(name) + "</LI>");
			}
		}
		sb.append("</UL>");
		return sb.toString();
	}

	/**
	 * Returns Error Message with HTML tag and CSS
	 * 
	 * @param request
	 * @return
	 */
	public static String getErrorMessage(HttpServletRequest request) {
		String msg = ServletUtility.getErrorMessage(request);
		if (!DataValidator.isNull(msg)) {
			msg = "<p class='st-error-header'>" + msg + "</p>";
		}
		return msg;
	}

	/**
	 * Returns Success Message with HTML tag and CSS
	 * 
	 * @param request
	 * @return
	 */

	public static String getSuccessMessage(HttpServletRequest request) {
		String msg = ServletUtility.getSuccessMessage(request);
		if (!DataValidator.isNull(msg)) {
			msg = "<p class='st-success-header'>" + msg + "</p>";
		}
		return msg;
	}

	/*    *//**
			 * Creates submit button if user has access permission.
			 * 
			 * @param label
			 * @param access
			 * @param request
			 * @return
			 */
	public static String getSubmitButton(String label, boolean access, HttpServletRequest request) {

		String button = "";

		if (access) {
			button = "<input type='submit' name='operation'    value='" + label + "' >";
		}
		return button;
	}

	public static String getList2(String name, String selectedVal, Map<Integer, String> map) {
		StringBuilder sb = new StringBuilder("<select class='form-control' name='" + name + "'>");

		// Add placeholder option
		sb.append("<option class='dropdown-item' value=''>------Select a " + name + "--------</option>");

		// Convert selectedVal to Integer for comparison
		Integer selectedKey = null;
		try {
			selectedKey = Integer.parseInt(selectedVal); // Convert selectedVal to Integer
		} catch (NumberFormatException e) {
			// Handle if selectedVal is not a valid integer
			e.printStackTrace(); // or log the error
		}

		// Iterate over the map entries
		for (Map.Entry<Integer, String> entry : map.entrySet()) {
			Integer key = entry.getKey();
			String val = entry.getValue();

			// Convert key to String for comparison and value attribute
			String keyString = key.toString();

			// Add option with selected attribute if it matches selectedVal
			if (selectedKey != null && key.equals(selectedKey)) {
				sb.append("<option selected value='" + keyString + "'>" + val + "</option>");
			} else {
				sb.append("<option value='" + keyString + "'>" + val + "</option>");
			}
		}

		sb.append("</select>");
		System.out.println("get list 1=========" + sb.toString());

		return sb.toString();
	}

}