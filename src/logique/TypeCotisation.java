package logique;

public enum TypeCotisation {
	  MENSUEL("Mensuel", '1'),
	  AUTRE("Autre", '0');

	  private String name = "";
	  private char codeType ;
	   
	  //Constructeur
	  TypeCotisation(String name, char codeType){
	    this.name = name;
	    this.codeType = codeType;
	  }
	   
	  public char getCodeType(){
	    return codeType;
	  }
	   
	  public String toString(){
	    return name;
	  }
}
