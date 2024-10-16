import json
import random
import requests
import re

from time import sleep
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service

reels = []
posts = []
imagens = []
elementos = []
dados = []

def tempo(qtoespera):
    espera=random.randrange(qtoespera-1, qtoespera+2)
    sleep(espera)

def conexao():
    dados = {
        'imagem':'image4.png',
        'descricao':'teste de coleta',
        'link':'aqui e o robot.html'
    }
    try:
        response = requests.post("http://localhost/decure/midia-coleta.php", data=dados)
        if response.status_code == 200:
            print("resposta do servidor ", response.text)
        else:
            print(f"Erro da requisição {response.status_code}")

    except requests.exceptions.RequestException as e:
            print(f"Ocorreu um erro: {e}")



class InstagramBot:
    def __init__(self,username,password):
        self.username = username
        self.password = password
        service = Service()
        options = webdriver.ChromeOptions()
        self.driver = webdriver.Chrome(service=service, options=options)

    def login(self):
        driver = self.driver
        driver.get('https://www.instagram.com')  
        tempo(5)
        usuario = driver.find_element(By.NAME,'username')
        tempo(3)
        usuario.send_keys(self.username)
        tempo(2)
        senha = driver.find_element(By.NAME,'password')
        senha.send_keys(self.password)
        senha.send_keys(Keys.RETURN)
        tempo(5)
        
    def pegaposts(self):    
        driver = self.driver
        driver.get('https://www.instagram.com/mis_sp/')
        tempo(5)
        print("procurando info")
        elementos = driver.find_elements(By.TAG_NAME, 'a')
        for postagem in elementos:
            post_link = postagem.get_attribute("href")
            if "instagram.com/p/" in post_link:
                posts.append(post_link)
                print(post_link)

        for dado in posts:
            if "fbcdn.net" in dado:
            #    imagens.append(nome)
                print(dado)

        tempo(10)
#        driver.get(posts[0])
        tempo(12)
        driver.close()



#conexao()
Bot = InstagramBot('cristais_serra', 'Vela!hot5')
Bot.login()
Bot.pegaposts()




