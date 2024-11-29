import json
import random
import requests
import re
import urllib.request

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
descricao=""

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
        tempo(8)

    def entralink(self, url):
        self.driver.get(url)
        tempo(6)
        global descricao
        elemdesc = self.driver.find_element(By.XPATH,'/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div[2]/div[1]/article/div/div[2]/div/div[2]/div[1]/ul/div[1]/li/div/div/div[2]/div[1]/h1')        
        descricao = elemdesc.text
        elemimagem = self.driver.find_element(By.XPATH,'/html/body/div[2]/div/div/div/div[2]/div/div/div[1]/div[1]/div[1]/section/main/div[2]/div[1]/article/div/div[1]/div/div[1]/div[2]/div/div/div/ul/li[2]/div/div/div/div/div[1]/img')
        imagem = elemimagem.get_attribute("src")
        urllib.request.urlretrieve(imagem,"images/masp01.jpg")

    def pegaposts(self):    
        navega = self.driver
        navega.get('https://www.instagram.com/masp/')
        tempo(7)
        elementos = navega.find_elements(By.TAG_NAME, 'a')
        for postagem in elementos:
            post_link = postagem.get_attribute("href")
            if "instagram.com/masp/p" in post_link:
                posts.append(post_link)

Bot = InstagramBot()
Bot.login()
Bot.pegaposts()
Bot.entralink(posts[0])

dados = { 'imagem':'masp01.jpg',
        'descricao':None,
        'endereco':'av paulista, 2554',
        'contato':'joao',
        'agendamento':'falar com severino',
        'link':'aqui e o robot.html' }

dados['descricao']=descricao
print (dados)
conexao()
tempo(100)