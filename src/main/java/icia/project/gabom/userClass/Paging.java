package icia.project.gabom.userClass;

public class Paging {
   private int maxNum;       // 전체 글의 개수
   private int pageNum;       // 현재 페이지 번호
   private int listCount; //10      // 페이지당 나타낼 글의 갯수
   private int pageCount; //2      // 페이지그룹당 페이지 갯수
   private int boardNum; // 해당 게시글 페이지 
   private String boardName;    // 게시판의 종류

   public Paging(int maxNum, int pageNum, int listCount, int pageCount, int boardNum, String boardName) {
      this.maxNum = maxNum;
      this.pageNum = pageNum;
      this.listCount = listCount;
      this.pageCount = pageCount;
      this.boardName = boardName;
      this.boardNum = boardNum;
   }

   @SuppressWarnings("unused")
   public String makeHtmlPaging() {
      // 전체 페이지 갯수
      int totalPage = (maxNum % listCount > 0)
            ?maxNum/listCount+1 : maxNum/listCount;
      // 전체 페이지 그룹 갯수
      int totalGroup = (totalPage % pageCount > 0)
            ? totalPage/pageCount+1 : totalPage/pageCount;
      // 현재 페이지가 속해 있는 그룹 번호
      int currentGroup = (pageNum % pageCount > 0)
            ? pageNum/pageCount+1 : pageNum/pageCount;
      return makeHtml(currentGroup, totalPage, boardName);
   }

   private String makeHtml(int currentGroup, int totalPage, String boardName) {
      StringBuffer sb = new StringBuffer();
      //현재그룹의 시작 페이지 번호
      int start = (currentGroup * pageCount) 
                - (pageCount - 1);
      //현재그룹의 끝 페이지 번호
      int end = (currentGroup * pageCount >= totalPage)
            ? totalPage
            : currentGroup * pageCount;

      if (start != 1) {
    	 //<li class="page-item"><a class="page-link" href="#">Previous</a></li>
    	 //sb.append("<a class=\"page-link\" href='"+boardName+"?pageNum=" + (start -1) + "'>");
    	  
    	 sb.append("<li class=\"page-item\">"); 
         sb.append("<a class=\"page-link pagebtn\" href=\"#\" data-bnum='"+boardNum+"' data-page='"+(start -1)+"'>");
         sb.append("[이전]");
         sb.append("</a>");
         sb.append("</li>"); 
         
      }

      for (int i = start; i <= end; i++) {
    	  
         if (pageNum != i) { //현재 페이지가 아닌 경우 링크처리
        	 
        	sb.append("<li class=\"page-item\">");
        	sb.append("<a class=\"page-link pagebtn\" href=\"#\" data-bnum='"+boardNum+"' data-page='"+i+"'>");
            sb.append(" [ ");
            
            sb.append(i);
            sb.append(" ] ");
            
            sb.append("</a>");
            sb.append("</li>");
            
         } else { //현재 페이지인 경우 링크 해제
        	sb.append("<li class=\"page-item active\">");
        	
        	sb.append("<a class=\"page-link pagebtn\" href=\"#\" data-bnum='"+boardNum+"' data-page='"+i+"'>");
            sb.append(" [ ");
            
            sb.append(i);
            sb.append(" ] ");
            
            sb.append("</a>");
            
            sb.append("</li>");
         }
         
      }
      
      if (end != totalPage) {
    	  
    	 sb.append("<li class=\"page-item\">"); 
         sb.append("<a class=\"page-link pagebtn\" href=\"#\" data-bnum='"+boardNum+"' data-page='"+(end + 1)+"'>"); 
         sb.append("[다음]");
         sb.append("</a>");
         sb.append("</li>"); 
         
      }
      return sb.toString();
   }
}