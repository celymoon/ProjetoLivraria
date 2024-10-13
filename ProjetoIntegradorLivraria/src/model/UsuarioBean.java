package model;

import java.io.Serializable;

	
	public class UsuarioBean implements Serializable {
		
		private static final long serialVersionUID = 1L;
		
		protected int id;
		protected String usuario;
		protected String senha;
		
		
		public UsuarioBean() {}
		
		
		public UsuarioBean(String usuario, String senha) {
			super();
			this.usuario = usuario;
			this.senha = senha;
		}
		public UsuarioBean(int id, String usuario, String senha) {
			super();
			this.id = id;
			this.usuario = usuario;
			this.senha = senha;
		}
	
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getUsuario() {
			return usuario;
		}
		public void setUsuario(String usuario) {
			this.usuario = usuario;
		}
		public String getSenha() {
			return senha;
		}
		public void setSenha(String senha) {
			this.senha = senha;
		}	
		
	}

