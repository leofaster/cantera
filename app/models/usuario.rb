# coding: utf-8
class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nombre, :apellido, :cedula, :telefono, :email, :password, :password_confirmation, :remember_me, :futboladas_attributes, :tipo, :confirmed_at
  # attr_accessible :title, :body

  validates :nombre, :presence => { :message => "El nombre debe estar presente" }
  validates :apellido, :presence => { :message => "El apellido debe estar presente" }
  validates :cedula, :presence => { :message => "La cédula debe estar presente" }
  validates :email, :presence => { :message => "El email debe estar presente" }

  validates :cedula, :uniqueness => { :message => "La cédula suministrada ya existe" }

  has_many :futboladas

  accepts_nested_attributes_for :futboladas
end
