package com.kh.dduck.common;

public class PageBarFactory {
   
   public static String getPageBar(int totalCount, int cPage, int numPerPage, String url) {
      String pageBar = "";
      int pageBarSize = 5;

      int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
      int pageEnd = pageNo + pageBarSize - 1;

      int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

      pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

      if (pageNo == 1) {
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
         pageBar += "</li>";
      } else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
         pageBar += "</li>";
      }

      while (!(pageNo > pageEnd || pageNo > totalPage)) {
         if (cPage == pageNo) {
            pageBar += "<li class='page-item active'>";
            pageBar += "<a class='page-link'>" + pageNo + "</a>";
            pageBar += "</li>";
         } else {
            pageBar += "<li class='page-item'>";
            pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + (pageNo) + ")'>" + pageNo + "</a>";
            pageBar += "</li>";
         }
         pageNo++;
      }
      if (pageNo > totalPage) {
         pageBar += "<li class='page-item disabled'>";
         pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
         pageBar += "</li>";
      } else {
         pageBar += "<li class='page-item'>";
         pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + pageNo + ")'>다음</a>";
         pageBar += "</li>";
      }
      pageBar += "</ul>";

      pageBar += "<script>";
      pageBar += "function fn_paging(cPage){";
      pageBar += "location.href='" + url + "?cPage='+cPage";
      pageBar += "}";
      pageBar += "</script>";
      return pageBar;
   }

   public static String getPageBar2(int totalCount, int cPage, int numPerPage, String url,int pCode) {
	   String pageBar="";
	      int pageBarSize=5;
	      
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
	      
	      pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	      
	      if(pageNo==1) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
	         pageBar+="</li>";
	      }else {
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' "
	               + "href='javascript:fn_paging("+(pageNo-1)+","+pCode+")'>이전</a>";
	         pageBar+="</li>";
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {
	         if(cPage==pageNo) {
	            pageBar+="<li class='page-item active'>";
	            pageBar+="<a class='page-link'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<a class='page-link' "
	                  + "href='javascript:fn_paging("+(pageNo+","+pCode)+")'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }
	         pageNo++;
	      }
	      if(pageNo>totalPage) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
	         pageBar+="</li>";
	      }else {
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' "
	               + "href='javascript:fn_paging("+(pageNo+","+pCode)+")'>다음</a>";
	         pageBar+="</li>";
	      }
	      pageBar+="</ul>";
	      
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging(cPage,pCode){";
	      pageBar+="location.href='"+url+"?cPage='+cPage+'&pCode='+pCode";
	      pageBar+="}";
	      pageBar+="</script>";
	      return pageBar;
   }
   
  

   
   

   public static String getPageBarWhere(int totalCount, int cPage, int numPerPage, String url,int gCode) {
      String pageBar="";
      int pageBarSize=5;
      
      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
      int pageEnd=pageNo+pageBarSize-1;
      
      int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
      
      pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
      
      if(pageNo==1) {
         pageBar+="<li class='page-item disabled'>";
         pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
         pageBar+="</li>";
      }else {
         pageBar+="<li class='page-item'>";
         pageBar+="<a class='page-link' "
               + "href='javascript:fn_paging("+(pageNo-1)+","+gCode+")'>이전</a>";
         pageBar+="</li>";
      }
      
      while(!(pageNo>pageEnd||pageNo>totalPage)) {
         if(cPage==pageNo) {
            pageBar+="<li class='page-item active'>";
            pageBar+="<a class='page-link'>"+pageNo+"</a>";
            pageBar+="</li>";
         }else {
            pageBar+="<li class='page-item'>";
            pageBar+="<a class='page-link' "
                  + "href='javascript:fn_paging("+(pageNo+","+gCode)+")'>"+pageNo+"</a>";
            pageBar+="</li>";
         }
         pageNo++;
      }
      if(pageNo>totalPage) {
         pageBar+="<li class='page-item disabled'>";
         pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
         pageBar+="</li>";
      }else {
         pageBar+="<li class='page-item'>";
         pageBar+="<a class='page-link' "
               + "href='javascript:fn_paging("+(pageNo+","+gCode)+")'>다음</a>";
         pageBar+="</li>";
      }
      pageBar+="</ul>";
      
      
      pageBar+="<script>";
      pageBar+="function fn_paging(cPage,gCode){";
      pageBar+="location.href='"+url+"?cPage='+cPage+'&gCode='+gCode";
      pageBar+="}";
      pageBar+="</script>";
      return pageBar;
   }





   
   public static String getPageBarWhere2(int totalCount, int cPage, int numPerPage, String url,String keyword) {
      String pageBar="";
      int pageBarSize=5;
      
      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
      int pageEnd=pageNo+pageBarSize-1;
      
      int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
      
      pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
      
      if(pageNo==1) {
         pageBar+="<li class='page-item disabled'>";
         pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
         pageBar+="</li>";
      }else {
         pageBar+="<li class='page-item'>";
         pageBar+="<a class='page-link' "
               + "href='javascript:fn_paging("+(pageNo-1)+","+keyword+")'>이전</a>";
         pageBar+="</li>";
      }
      
      while(!(pageNo>pageEnd||pageNo>totalPage)) {
         if(cPage==pageNo) {
            pageBar+="<li class='page-item active'>";
            pageBar+="<a class='page-link'>"+pageNo+"</a>";
            pageBar+="</li>";
         }else {
            pageBar+="<li class='page-item'>";
            pageBar+="<a class='page-link' "
                  + "href='javascript:fn_paging("+(pageNo+","+keyword)+")'>"+pageNo+"</a>";
            pageBar+="</li>";
         }
         pageNo++;
      }
      if(pageNo>totalPage) {
         pageBar+="<li class='page-item disabled'>";
         pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
         pageBar+="</li>";
      }else {
         pageBar+="<li class='page-item'>";
         pageBar+="<a class='page-link' "
               + "href='javascript:fn_paging("+(pageNo+","+keyword)+")'>다음</a>";
         pageBar+="</li>";
      }
      pageBar+="</ul>";
      
      
      pageBar+="<script>";
      pageBar+="function fn_paging(cPage,keyword){";
      pageBar+="location.href='"+url+"?cPage='+cPage+'&keyword='+keyword";
      pageBar+="}";
      pageBar+="</script>";
      return pageBar;
   }
   
   
 

	public static String getPageBarWhere3(int totalCount, int cPage, int numPerPage, String url,int gCode, String searchWord) {
		String pageBar="";
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo-1)+","+gCode+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' "
						+ "href='javascript:fn_paging("+(pageNo+","+gCode)+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' "
					+ "href='javascript:fn_paging("+(pageNo+","+gCode)+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage,gCode){";
		pageBar+="location.href='"+url+"?cPage='+cPage+'&gCode='+gCode";
		pageBar+="}";
		pageBar+="</script>";
		return pageBar;
	}
	
	   public static String getPageBarQna(int totalCount, int cPage, int numPerPage, String url, int qcCode) {
		      String pageBar = "";
		      int pageBarSize = 5;

		      int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		      int pageEnd = pageNo + pageBarSize - 1;

		      int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		      pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		      if (pageNo == 1) {
		         pageBar += "<li class='page-item disabled'>";
		         pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
		         pageBar += "</li>";
		      } else {
		         pageBar += "<li class='page-item'>";
		         pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
		         pageBar += "</li>";
		      }

		      while (!(pageNo > pageEnd || pageNo > totalPage)) {
		         if (cPage == pageNo) {
		            pageBar += "<li class='page-item active'>";
		            pageBar += "<a class='page-link'>" + pageNo + "</a>";
		            pageBar += "</li>";
		         } else {
		            pageBar += "<li class='page-item'>";
		            pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + (pageNo) + ")'>" + pageNo + "</a>";
		            pageBar += "</li>";
		         }
		         pageNo++;
		      }
		      if (pageNo > totalPage) {
		         pageBar += "<li class='page-item disabled'>";
		         pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
		         pageBar += "</li>";
		      } else {
		         pageBar += "<li class='page-item'>";
		         pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + pageNo + ")'>다음</a>";
		         pageBar += "</li>";
		      }
		      pageBar += "</ul>";

		      pageBar += "<script>";
		      pageBar += "function fn_paging(cPage){";
		      pageBar += "location.href='" + url + "?cPage='+cPage";
		      pageBar += "}";
		      pageBar += "</script>";
		      return pageBar;
		   }
}
