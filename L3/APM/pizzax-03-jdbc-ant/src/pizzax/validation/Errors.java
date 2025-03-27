package pizzax.validation;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Errors {

	private static class ErrorInfo {
		private String fieldName;
		private String errorCode;

		public ErrorInfo(String fieldName, String errorCode) {
			this.fieldName = fieldName;
			this.errorCode = errorCode;
		}

		public String getFieldName() {
			return fieldName;
		}

		public String getErrorCode() {
			return errorCode;
		}
	}

	private List<ErrorInfo> errorInfoList = new ArrayList<ErrorInfo>();

	public int getErrorCount() {
		return errorInfoList.size();
	}

	public boolean hasFieldErrors(String fieldName) {
		Iterator<ErrorInfo> iterator = errorInfoList.iterator();
		while (iterator.hasNext()) {
			ErrorInfo errorInfo = iterator.next();
			if (errorInfo.getFieldName().equals(fieldName))
				return true;
		}
		return false;
	}

	public void rejectValue(String fieldName, String errorCode) {
		errorInfoList.add(new ErrorInfo(fieldName, errorCode));
	}

	public void clear() {
		errorInfoList.clear();
	}

	public void reject(String errorCode) {
		errorInfoList.add(new ErrorInfo(null, errorCode));
	}

}
