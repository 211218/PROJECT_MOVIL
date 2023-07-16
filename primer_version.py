from flask import Flask, request, jsonify
import jwt
from functools import wraps
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configuración de la conexión a MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'cxxmigue211218'
app.config['MYSQL_DB'] = 'movil'
app.config['SECRET_KEY'] = 'g45Hq#@34nd7d09sJ5F'

# Inicializar la extensión Flask-MySQLdb
mysql = MySQL(app)

users = []
publications = []
comments = []

# Función para verificar la validez del token
def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')

        if not token:
            return jsonify({'message': 'Token is missing'}), 401

        try:
            # Verificar y decodificar el token
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
            print("token: ", data)
        except:
            return jsonify({'message': 'Token is invalid here'}), 401

        return f(*args, **kwargs)

    return decorated

# Rutas y funciones para la entidad "User":

# CREATE - Agregar un nuevo usuario
@app.route('/api/create_user', methods=['POST'])
def create_user():
    cur = mysql.connection.cursor()

    id_user = request.json['id_user']
    username = request.json['username']
    password = request.json['password']
    number_phone = request.json['number_phone']
    email = request.json['email']
    email_verified = False

    cur.execute("INSERT INTO users (id_user, username, password, number_phone, email, email_verified) VALUES (%s, %s, %s, %s, %s, %s)",
                (id_user, username, password, number_phone, email, email_verified))

    mysql.connection.commit()
    cur.close()

    # Generar un token con los datos del usuario
    token = jwt.encode({'id_user': id_user, 'email': email}, app.config['SECRET_KEY'], algorithm="HS256")

    return jsonify({'message': 'User created successfully', 'token': token})

# READ - Obtener todos los usuarios
@app.route('/api/user_all', methods=['GET'])
@token_required
def get_all_users():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users")
    users = cur.fetchall()
    cur.close()

    user_list = []
    for user in users:
        user_data = {
            'id_user': user[0],
            'username': user[1],
            'password': user[2],
            'number_phone': user[3],
            'email': user[4],
            'email_verified': user[5]
        }
        user_list.append(user_data)

    return jsonify(user_list)

# READ - Obtener un usuario por su ID
@app.route('/api/user/<int:user_id>', methods=['GET'])
@token_required
def get_user(user_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users WHERE id_user = %s", (user_id,))
    user = cur.fetchone()
    cur.close()

    if user:
        user_data = {
            'id_user': user[0],
            'username': user[1],
            'password': user[2],
            'number_phone': user[3],
            'email': user[4],
            'email_verified': user[5]
        }
        return jsonify(user_data)

    return jsonify({'message': 'User not found'})

# UPDATE - Actualizar un usuario por su ID
@app.route('/api/user/<int:user_id>', methods=['PUT'])
@token_required
def update_user(user_id):
    cur = mysql.connection.cursor()

    username = request.json['username']
    password = request.json['password']
    number_phone = request.json['number_phone']

    cur.execute("UPDATE users SET username = %s, password = %s, number_phone = %s WHERE id_user = %s",
                (username, password, number_phone, user_id))

    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'User updated successfully'})

# DELETE - Eliminar un usuario por su ID
@app.route('/api/user/<int:user_id>', methods=['DELETE'])
@token_required
def delete_user(user_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM users WHERE id_user = %s", (user_id,))
    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'User deleted successfully'})

# Rutas y funciones para la entidad "Publications":

# CREATE - Agregar una nueva publicación
@app.route('/api/publication', methods=['POST'])
@token_required
def create_publication():
    cur = mysql.connection.cursor()

    id_publication = request.json['id_publication']
    id_user = request.json['id_user']
    img_publication = request.json['img_publication']
    description = request.json['description']
    count_start = request.json['count_start']
    time = request.json['time']

    cur.execute("INSERT INTO publications (id_publication, id_user, img_publication, description, count_start, time) VALUES (%s, %s, %s, %s, %s, %s)",
                (id_publication, id_user, img_publication, description, count_start, time))

    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'Publication created successfully'})

# READ - Obtener todas las publicaciones
@app.route('/api/publication', methods=['GET'])
@token_required
def get_all_publications():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM publications")
    publications = cur.fetchall()
    cur.close()

    publication_list = []
    for publication in publications:
        publication_data = {
            'id_publication': publication[0],
            'id_user': publication[1],
            'img_publication': publication[2],
            'description': publication[3],
            'count_start': publication[4],
            'time': publication[5]
        }
        publication_list.append(publication_data)

    return jsonify(publication_list)

# READ - Obtener una publicación por su ID
@app.route('/api/publication/<int:publication_id>', methods=['GET'])
@token_required
def get_publication(publication_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM publications WHERE id_publication = %s", (publication_id,))
    publication = cur.fetchone()
    cur.close()

    if publication:
        publication_data = {
            'id_publication': publication[0],
            'id_user': publication[1],
            'img_publication': publication[2],
            'description': publication[3],
            'count_start': publication[4],
            'time': publication[5]
        }
        return jsonify(publication_data)

    return jsonify({'message': 'Publication not found'})

# UPDATE - Actualizar una publicación por su ID
@app.route('/api/publication/<int:publication_id>', methods=['PUT'])
@token_required
def update_publication(publication_id):
    cur = mysql.connection.cursor()

    id_user = request.json['id_user']
    img_publication = request.json['img_publication']
    description = request.json['description']
    count_start = request.json['count_start']
    time = request.json['time']

    cur.execute("UPDATE publications SET id_user = %s, img_publication = %s, description = %s, count_start = %s, time = %s WHERE id_publication = %s",
                (id_user, img_publication, description, count_start, time, publication_id))

    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'Publication updated successfully'})

# DELETE - Eliminar una publicación por su ID
@app.route('/api/publication/<int:publication_id>', methods=['DELETE'])
@token_required
def delete_publication(publication_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM publications WHERE id_publication = %s", (publication_id,))
    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'Publication deleted successfully'})

# Rutas y funciones para la entidad "Comments":

# CREATE - Agregar un nuevo comentario
@app.route('/api/comment', methods=['POST'])
@token_required
def create_comment():
    cur = mysql.connection.cursor()

    id_user = request.json['id_user']
    user = request.json['user']
    comment_user = request.json['comment_user']

    cur.execute("INSERT INTO comments (id_user, user, comment_user) VALUES (%s, %s, %s)",
                (id_user, user, comment_user))

    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'Comment created successfully'})

# READ - Obtener todos los comentarios
@app.route('/api/comment', methods=['GET'])
@token_required
def get_all_comments():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM comments")
    comments = cur.fetchall()
    cur.close()

    comment_list = []
    for comment in comments:
        comment_data = {
            'id_user': comment[0],
            'user': comment[1],
            'comment_user': comment[2]
        }
        comment_list.append(comment_data)

    return jsonify(comment_list)

# DELETE - Eliminar un comentario por su ID de usuario
@app.route('/api/comment/<int:user_id>', methods=['DELETE'])
@token_required
def delete_comment(user_id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM comments WHERE id_user = %s", (user_id,))
    mysql.connection.commit()
    cur.close()

    return jsonify({'message': 'Comment deleted successfully'})

# Ruta para el inicio de sesión (Login)
@app.route('/api/login', methods=['POST'])
def login():
    username = request.json['username']
    password = request.json['password']

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
    user = cur.fetchone()
    cur.close()

    if user:
        # Generar un token con los datos del usuario
        token = jwt.encode({'id_user': user[0], 'email': user[4]}, app.config['SECRET_KEY'], algorithm="HS256")
        return jsonify({'message': 'Login successful', 'token': token})

    return jsonify({'message': 'Invalid credentials'})


if __name__ == '__main__':
    app.run(debug=True)
