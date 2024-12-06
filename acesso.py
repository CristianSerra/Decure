import json
import random
import requests
import re
import urllib.request
import base64
from operator import itemgetter

from time import sleep
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service

paginas = [ "casatriangulo" ]
dados = { 'imagem':None, 'descricao':None }

def tempo(qtoespera):
    espera=random.randrange(qtoespera-1, qtoespera+2)
    sleep(espera)

def conexao():
    try:
        response = requests.post("http://localhost/decure/midia.php", data=dados)
        if response.status_code == 200:
            print("resposta do servidor ", response.text)
        else:
            print(f"Erro da requisição {response.status_code}")

    except requests.exceptions.RequestException as e:
            print(f"Ocorreu um erro: {e}")

class InstagramBot:
    def __init__(self):
        f = open("C:\\Users\\Administrador\\Documents\\site\\Decure\\cred.txt")
        usuario = f.readline()
        senha = f.readline()
        self.username = usuario
        self.password = senha
        service = Service()
        options = webdriver.ChromeOptions()
        self.driver = webdriver.Chrome(service=service, options=options, keep_alive=True)

    def login(self):
        driver = self.driver
        driver.get('https://www.instagram.com')  
        tempo(4)
        usuario = driver.find_element(By.NAME,'username')
        usuario.send_keys(self.username)
        senha = driver.find_element(By.NAME,'password')
        senha.send_keys(self.password)
        tempo(2)
        senha.send_keys(Keys.RETURN)

    def pegaposts(self, url):    
        navega = self.driver
        site="https://www.instagram.com/"+url
        navega.get(site)
        tempo(7)
        posts = []
        elementos = []
        elementos = navega.find_elements(By.TAG_NAME, 'a')
        for postagem in elementos:
            post_link = postagem.get_attribute("href")
            print (post_link)
            poststring="instagram.com/"+url+"/p"
            if poststring in post_link:
                posts.append(post_link)
        x=0
        navega.get(posts[x])
        tempo(4)
        global descricao, imagem        
        descricao = navega.find_element(By.XPATH,'/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div[2]/div[1]/article/div/div[2]/div/div[2]/div[1]/ul/div[1]/li/div/div/div[2]/div[1]/h1').text
        imagem=navega.find_element(By.XPATH,'/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div[2]/div[1]/article/div/div[1]/div/div[1]/div[2]/div/div/div/ul/li[2]/div/div/div/div/div[1]/img').get_attribute("src")
        arquivo = "images/"+url+str(x)+".jpg"
        urllib.request.urlretrieve(imagem,arquivo)
        dados['descricao']=descricao
        dados['imagem']=arquivo
        conexao()
        tempo(5)

Bot = InstagramBot()
Bot.login()
tempo(10)

for pag in paginas:
    Bot.pegaposts(pag)
    tempo(8)
