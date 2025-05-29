from .db import db
from sqlalchemy.dialects.postgresql import ENUM

estado_renta_enum = ENUM('Activa', 'Finalizada', 'Cancelada', name='estado_renta_enum', create_type=False)

class DetalleRenta(db.Model):
    __tablename__ = 'detalle_renta'
    id_detallerenta = db.Column(db.Integer, primary_key=True)
    fecha_adquisición = db.Column(db.Date, nullable=False)
    fecha_devolucion = db.Column(db.Date, nullable=False)
    estado_renta = db.Column(estado_renta_enum, nullable=False)
    monto_total = db.Column(db.Numeric(10, 2), nullable=False)