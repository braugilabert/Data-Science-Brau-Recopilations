import hashlib
import datetime
import requests

import pandas as pd
from variables import *
from funktions import *

import os

print(os.getcwd())

# def hash_params(timestamp,priv_key,pub_key):
#     """ Marvel API requires server side API calls to include
#     md5 hash of timestamp + public key + private key """

#     hash_md5 = hashlib.md5()
#     hash_md5.update(f'{timestamp}{priv_key}{pub_key}'.encode('utf-8'))
#     hashed_params = hash_md5.hexdigest()

#     return hashed_params


timestamp = datetime.datetime.now().strftime('%Y-%m-%d%H:%M:%S')

j=0
while j<10:
    offset=limit*j
    print(offset)
    
    params={'ts': timestamp, 
        'apikey': pub_key, 
        'hash': hash_params(timestamp,priv_key,pub_key),
        'nameStartsWith': letter,
        'offset':offset,
        'limit': limit};
    res = requests.get(url,params=params)

    respuesta_json = res.json()


    for i in respuesta_json['data']['results']:
        marvel_dict['id'].append(i['id'])
        marvel_dict['name'].append(i['name'])
        marvel_dict['images'].append(i['thumbnail']['path']+'.'+i['thumbnail']['extension'])


    j+=1



dataframe=pd.DataFrame(marvel_dict)
dataframe.to_csv('./champions.csv')