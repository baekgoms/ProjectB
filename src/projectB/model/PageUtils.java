package projectB.model;

import java.util.HashMap;
import java.util.Map;

public class PageUtils {
	public static Map<String, Integer> pageInfos(int length, int pageLength, int totalCount, int page) {
		Map<String, Integer> map = new HashMap<>();
		
		int startRow = (page - 1) * length + 1;
		int endRow = (page) * length;
		
		int pageTotalCount = totalCount / length;
		if (totalCount % length > 0)
			pageTotalCount++;
		
		int startPageIndex = (((page - 1) / pageLength) * pageLength) + 1;
		int endPageIndex = startPageIndex + pageLength - 1;
		if (endPageIndex > pageTotalCount)
			endPageIndex = pageTotalCount;
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("pageTotalCount", pageTotalCount);
		map.put("startPageIndex", startPageIndex);
		map.put("endPageIndex", endPageIndex);		
		
		return map;
	}
	
	public static int startRow(int length, int page) {
		return (page - 1) * length + 1;
	}
	
	public static int endRow(int length, int page) {
		return (page) * length;
	}
	
	public static int pageTotalCount(int length, int totalCount) {
		int pageTotalCount = totalCount / length;
		if (totalCount % length > 0)
			pageTotalCount++;
		
		return pageTotalCount;
	}
	
	public static int startPage(int length, int pageLength, int page) {
		return (((page - 1) / pageLength) * pageLength) + 1;
	}
	
	public static int endPage(int startPage, int pageLength, int pageTotalCount) {
		int endPage = startPage + pageLength - 1;
		if (endPage > pageTotalCount)
			endPage = pageTotalCount;
		
		return endPage;
	}
}
