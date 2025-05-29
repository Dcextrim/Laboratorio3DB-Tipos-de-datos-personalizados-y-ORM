from flask import Flask, render_template, request, redirect, url_for
from config import Config
from models.db import db
from sqlalchemy import text

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

with app.app_context():
    from models import Cliente, Instrumento, DetalleRenta, Renta

@app.route('/')
def index():
    rentas = db.session.execute(text('SELECT * FROM vista_renta_detallada')).fetchall()
    return render_template('index.html', rentas=rentas)

@app.route('/renta/nueva', methods=['GET', 'POST'])
def nueva_renta():
    from models import Cliente, Instrumento, DetalleRenta, Renta
    if request.method == 'POST':
        id_instrumento = request.form['instrumento']
        id_cliente = request.form['cliente']
        fecha_adq = request.form['fecha_adq']
        fecha_dev = request.form['fecha_dev']
        estado = request.form['estado']
        monto = request.form['monto']

        detalle = DetalleRenta(
            fecha_adquisición=fecha_adq,
            fecha_devolucion=fecha_dev,
            estado_renta=estado,
            monto_total=monto
        )
        db.session.add(detalle)
        db.session.commit()

        nueva_renta = Renta(
            id_instrumento=id_instrumento,
            id_cliente=id_cliente,
            id_detallerenta=detalle.id_detallerenta
        )
        db.session.add(nueva_renta)
        db.session.commit()

        return redirect(url_for('index'))

    clientes = Cliente.query.all()
    instrumentos = Instrumento.query.all()
    return render_template('form_renta.html', clientes=clientes, instrumentos=instrumentos)

@app.route('/renta/<int:id>/editar', methods=['GET', 'POST'])
def editar_renta(id):
    renta = Renta.query.get_or_404(id)
    detalle = renta.detalle

    if request.method == 'POST':
        renta.id_cliente = request.form['cliente']
        renta.id_instrumento = request.form['instrumento']
        detalle.fecha_adquisición = request.form['fecha_adq']
        detalle.fecha_devolucion = request.form['fecha_dev']
        detalle.estado_renta = request.form['estado']
        detalle.monto_total = request.form['monto']

        db.session.commit()
        return redirect(url_for('index'))

    clientes = Cliente.query.all()
    instrumentos = Instrumento.query.all()
    return render_template('form_renta.html', renta=renta, detalle=detalle, clientes=clientes, instrumentos=instrumentos)

@app.route('/renta/<int:id>/eliminar', methods=['POST'])
def eliminar_renta(id):
    renta = Renta.query.get_or_404(id)
    db.session.delete(renta)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
