from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://maria:meu-cinema@cluster0.920ilsx.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0')

db = client['maria']

@keyword('Limpar usuário')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by ' + email)