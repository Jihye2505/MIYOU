package global.sesoc.gitTest.vo;

public class MiyouTranslate {

	private String inputText;
	private String userLanguage;

	public MiyouTranslate(String inputText, String userLanguage) {
		super();
		this.inputText = inputText;
		this.userLanguage = userLanguage;
	}

	public MiyouTranslate() {
		super();
	}

	public String getInputText() {
		return inputText;
	}

	public void setInputText(String inputText) {
		this.inputText = inputText;
	}

	public String getUserLanguage() {
		return userLanguage;
	}

	public void setUserLanguage(String userLanguage) {
		this.userLanguage = userLanguage;
	}

	@Override
	public String toString() {
		return "translate [inputText=" + inputText + ", userLanguage=" + userLanguage + "]";
	}

}
