from .db import db
from sqlalchemy.dialects.postgresql import ENUM

estado_enum = ENUM('Disponible', 'Rentado', 'Mantenimiento', name='estado_instrumento_enum', create_type=False)
tipo_enum = ENUM('Viento', 'Metal', 'Percusión', 'Cuerdas', 'Electrofonos', name='tipo_instrumentos', create_type=False)

class Instrumento(db.Model):
    __tablename__ = 'instrumento'
    id_instrumento = db.Column(db.Integer, primary_key=True)
    nombre_instrumento = db.Column(db.String(100), nullable=False)
    tipo_instrumento = db.Column(tipo_enum, nullable=False)
    marca = db.Column(db.String(50))
    estado = db.Column(estado_enum, nullable=False, default='Disponible')
    precio_renta = db.Column(db.Numeric(10, 2), nullable=False)