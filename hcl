#from keep_alive import keep_alive
import os
import json_minify
try:
    import colorama
except ModuleNotFoundError:
    os.system("pip install colorama")
    os.system("pip install Hydrochloric.py")
     os.system("pip install Subclient")
     os.system("pip install Client")
    import colorama
try:
    import pyfiglet
except ModuleNotFoundError:
    os.system("pip install pyfiglet")
    import pyfiglet
from colorama import init, Fore, Back, Style
init()
print(Fore.YELLOW + Style.BRIGHT)
print(pyfiglet.figlet_format("ViCious", font="slant"))
print(pyfiglet.figlet_format("Coins script", font="slant"))
#keep_alive()
from hcl import Client, SubClient
from uuid import uuid4
import requests
import threading
import time
from threading import Thread
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime
from os import path
import json
cid ="6700929"
THIS_FOLDER = path.dirname(path.abspath(__file__))
emailfile=path.join(THIS_FOLDER,"accounts.json")
dictlist=[]
with open(emailfile) as f:
    dictlist = json.load(f)
headers={        "cookies":"__cfduid=d0c98f07df2594b5f4aad802942cae1f01619569096",
"authorization":"Basic NWJiNTM0OWUxYzlkNDQwMDA2NzUwNjgwOmM0ZDJmYmIxLTVlYjItNDM5MC05MDk3LTkxZjlmMjQ5NDI4OA=="


    }


 


def tapcoins(usrd:str):
    data={"reward":{"ad_unit_id":"t00_tapjoy_android_master_checkinwallet_rewardedvideo_322","credentials_type":"publisher","custom_json":{"hashed_user_id":f"{usrd}"},"demand_type":"sdk_bidding","event_id":None,"network":"facebook","placement_tag":"default","reward_name":"Amino Coin","reward_valid":"true","reward_value":2,"shared_id":"dc042f0c-0c80-4dfd-9fde-87a5979d0d2f","version_id":"1569147951493","waterfall_id":"dc042f0c-0c80-4dfd-9fde-87a5979d0d2f"},


        "app":{"bundle_id":"com.narvii.amino.master","current_orientation":"portrait","release_version":"3.4.33567","user_agent":"Dalvik\/2.1.0 (Linux; U; Android 10; G8231 Build\/41.2.A.0.219; com.narvii.amino.master\/3.4.33567)"},"date_created":1620295485,"session_id":"49374c2c-1aa3-4094-b603-1cf2720dca67","device_user":{"country":"US","device":{"architecture":"aarch64","carrier":{"country_code":602,"name":"Vodafone","network_code":0},"is_phone":"true","model":"GT-S5360","model_type":"Samsung","operating_system":"android","operating_system_version":"29","screen_size":{"height":2260,"resolution":2.55,"width":1080}},"do_not_track":"false","idfa":"7495ec00-0490-4d53-8b9a-b5cc31ba885b","ip_address":"","locale":"en","timezone":{"location":"Asia\/Seoul","offset":"GMT+09:00"},"volume_enabled":"true"}
        }
    event=uuid4()
    data["reward"]["event_id"]=f"{event}"
    try:
        requests.post("https://ads.tapdaq.com/v4/analytics/reward",json=data, headers=headers)
    except:
    	pass
def magicnum():
    toime={"start":int(datetime.timestamp(datetime.now())),"end":int(datetime.timestamp(datetime.now()))+300}
    return toime
def sendobj(sub : SubClient):
    timer=[
    magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum(),magicnum()
    ]
    sub.send_active_obj(timers=timer)
def log(cli : Client,email : str, password : str):
    try:
        cli.login(email=email,password=password)
        print("\n°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°")
        print(f"logged into {email}\n")
    except Exception as e:
        print(e)
        pass
def task(sub : SubClient,email : str,us:str):
    try:
        sendobj(sub)
        for _ in range(1):
        	try:
        		threading.Thread(target=tapcoins,args=(us,)).start()
        	except:
        		pass
        print(f"Generated Coins for {email}")
    except:
        return None
def threadit(acc : dict):
    email=acc["email"]
    device=acc["device"]
    password=acc["password"]
    client=Client(deviceId=device)
    log(cli=client,email=email,password=password)
    client.join_community(cid)
    subclient=SubClient(comId=cid)
    print("done")
    usrd=client.userId
    for _ in range(300):
    	try:
    		threading.Thread(target=task, args=(subclient,email,usrd)).start()
    	except:
    		pass
    client.logout()
    print(f"Generated coins with {email}")
def main():
    print(f"Total {len(dictlist)} accounts loaded")
    for amp in dictlist:
    	threadit(amp)
if __name__ == '__main__':
	main()
