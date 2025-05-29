from .db import db

class Renta(db.Model):
    __tablename__ = 'renta'
    id_renta = db.Column(db.Integer, primary_key=True)
    id_instrumento = db.Column(db.Integer, db.ForeignKey('instrumento.id_instrumento'), nullable=False)
    id_cliente = db.Column(db.Integer, db.ForeignKey('cliente.id_cliente'), nullable=False)
    #id_detalleRenta = db.Column(db.Integer, db.ForeignKey('detalle_renta.id_detalleRenta'), nullable=False)
    id_detallerenta = db.Column(db.Integer, db.ForeignKey('detalle_renta.id_detallerenta'), nullable=False)


    instrumento = db.relationship('Instrumento')
    cliente = db.relationship('Cliente')
    detalle = db.relationship('DetalleRenta')