package pizzax.repository;

import pizzax.validation.Errors;

public class RepositoryException extends RuntimeException {

	private Errors errors;

	public RepositoryException(Errors errors) {
		this.errors = errors;
	}

	public RepositoryException(Exception ex) {
		super(ex);
	}

	public RepositoryException() {
		
	}

}
