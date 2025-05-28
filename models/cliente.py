from .db import db

class Cliente(db.Model):
    __tablename__ = 'cliente'
    id_cliente = db.Column(db.Integer, primary_key=True)
    nombre_cliente = db.Column(db.String(100), nullable=False)
    correo = db.Column(db.String(150), nullable=False, unique=True)
    telefono = db.Column(db.String(20))
    direccion = db.Column(db.String(200))