import pandas as pd
import numpy as np
import pickle

from selenium import webdriver
from time import sleep
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from fuzzywuzzy import process, fuzz
import warnings
warnings.filterwarnings('ignore')



def busqueda(lib,lista):
    driver = webdriver.Chrome(ChromeDriverManager().install())
    driver.get("https://www.goodreads.com/")
    driver.find_element("css selector","#sitesearch_field").click()
    driver.find_element("css selector","#sitesearch_field").send_keys(lib, Keys.ENTER)
    try:
        driver.implicitly_wait(2)
        driver.find_element("css selector","body > div:nth-child(3) > div > div > div.modal__close > button > img").click()
        try:
            driver.implicitly_wait(2)
            try:
                driver.find_element("xpath","/html/body/div[2]/div[3]/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[2]/a/span").click()
                driver.implicitly_wait(2)
                #Autor
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__contributor > h3 > div > span:nth-child(1) > a > span.ContributorLink__name").text)
                except:
                    lista.append(driver.find_element("css selector","#bookAuthors > span:nth-child(2) > div > a").text)
                #Nota media del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(1) > div").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > span:nth-child(2)").text)
                #Numero de votantes
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(2) > div > span:nth-child(1)").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > a:nth-child(7)").text)     
                #Titulo del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageTitleSection > div.BookPageTitleSection__title > h1").text)
                except:
                    lista.append(driver.find_element("css selector","#bookTitle").text)
                #En un futuro añadiré frases famosas de cada libro.
                """#Frase famosa
                sleep(1)
                try:
                    driver.find_element("css selector","#__next > div > main > div:nth-child(4) > div > div > a:nth-child(1) > div.DiscussionCard__middle > div.DiscussionCard__stats").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")
                except:
                    driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.rightContainer > div:nth-child(12) > div.bigBoxBody > div > a").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")"""
                
            except:
                driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > table > tbody > tr:nth-child(1) > td:nth-child(2) > a > span").click()
                driver.implicitly_wait(2)
                #Autor
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__contributor > h3 > div > span:nth-child(1) > a > span.ContributorLink__name").text)
                except:
                    lista.append(driver.find_element("css selector","#bookAuthors > span:nth-child(2) > div > a").text)
                #Nota media del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(1) > div").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > span:nth-child(2)").text)
                #Numero de votantes
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(2) > div > span:nth-child(1)").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > a:nth-child(7)").text)     
                #Titulo del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageTitleSection > div.BookPageTitleSection__title > h1").text)
                except:
                    lista.append(driver.find_element("css selector","#bookTitle").text)
                #En un futuro añadiré frases famosas de cada libro.
                """#Frase famosa
                sleep(1)
                try:
                    driver.find_element("css selector","#__next > div > main > div:nth-child(4) > div > div > a:nth-child(1) > div.DiscussionCard__middle > div.DiscussionCard__stats").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")
                except:
                    driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.rightContainer > div:nth-child(12) > div.bigBoxBody > div > a").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")"""
                     
        except:
            lista.append("No tiene autor")           
            lista.append("No tiene nota media")
            lista.append("No tiene cuento de votos")
            lista.append("No tiene libro")
    except:
        try:
            driver.implicitly_wait(2)
            try:
                driver.find_element("xpath","/html/body/div[2]/div[3]/div[1]/div[2]/div[2]/table/tbody/tr[1]/td[2]/a/span").click()
                driver.implicitly_wait(2)
                #Autor
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__contributor > h3 > div > span:nth-child(1) > a > span.ContributorLink__name").text)
                except:
                    lista.append(driver.find_element("css selector","#bookAuthors > span:nth-child(2) > div > a").text)
                #Nota media del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(1) > div").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > span:nth-child(2)").text)
                #Numero de votantes
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(2) > div > span:nth-child(1)").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > a:nth-child(7)").text)                
                #Titulo del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageTitleSection > div.BookPageTitleSection__title > h1").text)
                except:
                    lista.append(driver.find_element("css selector","#bookTitle").text)
                #En un futuro añadiré frases famosas de cada libro.
                """#Frase famosa
                sleep(1)
                try:
                    driver.find_element("css selector","#__next > div > main > div:nth-child(4) > div > div > a:nth-child(1) > div.DiscussionCard__middle > div.DiscussionCard__stats").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")
                except:
                    driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.rightContainer > div:nth-child(12) > div.bigBoxBody > div > a").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")"""
                
            except:
                driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > table > tbody > tr:nth-child(1) > td:nth-child(2) > a > span").click()
                driver.implicitly_wait(2)
                #Autor
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__contributor > h3 > div > span:nth-child(1) > a > span.ContributorLink__name").text)
                except:
                    lista.append(driver.find_element("css selector","#bookAuthors > span:nth-child(2) > div > a").text)
                #Nota media del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(1) > div").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > span:nth-child(2)").text)
                #Numero de votantes
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageMetadataSection > div.BookPageMetadataSection__ratingStats > a > div:nth-child(2) > div > span:nth-child(1)").text)
                except:
                    lista.append(driver.find_element("css selector","#bookMeta > a:nth-child(7)").text)
                #Titulo del libro
                try:
                    lista.append(driver.find_element("css selector","#__next > div > main > div.BookPage__gridContainer > div.BookPage__rightColumn > div.BookPage__mainContent > div.BookPageTitleSection > div.BookPageTitleSection__title > h1").text)
                except:
                    lista.append(driver.find_element("css selector","#bookTitle").text)
                #En un futuro añadiré frases famosas de cada libro.
                """"#Frase famosa
                sleep(1)
                try:
                    driver.find_element("css selector","#__next > div > main > div:nth-child(4) > div > div > a:nth-child(1) > div.DiscussionCard__middle > div.DiscussionCard__stats").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")
                except:
                    driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.rightContainer > div:nth-child(12) > div.bigBoxBody > div > a").click()
                    sleep(2)
                    driver.implicitly_wait(3)
                    try:
                        resultado.append(driver.find_element("css selector","body > div.content > div.mainContentContainer > div.mainContent > div.mainContentFloat > div.leftContainer > div:nth-child(11) > div > div.quoteDetails > div.quoteText").text)
                        return resultado
                    except:
                        return resultado.append("No tiene frase famosa")"""
                
        except:
            lista.append("No tiene autor")
            lista.append("No tiene nota media")
            lista.append("No tiene cuento de votos")
            lista.append("No tiene libro")


#Función para tener ordenadas las listas de listas scrapeadas.
def listas_libros(libros):
    lista_libros=[]
    for i in range(4):
        lista = [libro[i] for libro in libros]
        lista_libros.append(lista)
    return lista_libros

#Función para limpiar los votos de los usuarios.
def limpieza_votos(votos):
    a = votos.split(" ")[0]
    if a == "No":
        return None
    else:
        return float(a.replace(",","").replace(".",""))

#Función para limpiar las notas promedio de los libros.
def promedio(rating):
    if rating == "No tiene nota media":
        return None
    else:
        return float(rating)

#Función para limpiar los autores.
def Autor(au):
    if au == "No tiene autor":
        return None
    else:
        return au

#Fuzzy_wuzzy para filtrar las peliculas que coinciden con los libros.
def semejanza(lista1, lista2):
    lista = []
    for (a,b) in zip(lista1, lista2):
        porcentaje = fuzz.ratio(a,b)
        if porcentaje > 45:
            lista.append(True)
        else:
            lista.append(False)
    return lista