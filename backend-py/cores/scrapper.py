import aiohttp
import asyncio
import time
from bs4 import BeautifulSoup

url='http://noc.org.np/'
async def get_data():
    mhng_data={"test":1}
    pkh_data={"test":1}
    thk_data={"test":1}
    async with aiohttp.ClientSession() as session:
        res = await session.get(url)
        souped_data=BeautifulSoup(await res.text(),'lxml')
        main=souped_data.find_all('div',{'class':'carousel slide carousel-multi-item'})[0].find_all('div',{'class':'carousel-inner'})[0]
        __Mahendranagar=(main.find_all('div',{'class':'carousel-item active'}))[0]
        places_mahendranagar=__Mahendranagar.find_all('h6',{'class':'text-center'})[0].text
        mahendranagar_fuels=__Mahendranagar.find_all('h6',{'class':'text-center text-muted font-small'})
        mahendranagar_fuels_prices=__Mahendranagar.find_all('h5',{'class':'text-center primary-color-text'})
        mahendranagar_fuels=[fuel.text for fuel in mahendranagar_fuels]
        mahendranagar_fuels_prices=[price.text for price in mahendranagar_fuels_prices]
        for fuel,price in zip(mahendranagar_fuels,mahendranagar_fuels_prices):
            mhng_data.update({fuel:price})
        __Pokhara=main.find_all('div',{'class':'carousel-item'})[1]
        places_pokhara=__Pokhara.find_all('h6',{'class':'text-center'})[0].text
        pokhara_fuels=__Pokhara.find_all('h6',{'class':'text-center text-muted font-small'})
        pokhara_fuels_prices=__Pokhara.find_all('h5',{'class':'text-center primary-color-text'})
        pokhara_fuels=[fuel.text for fuel in pokhara_fuels]
        pokhara_fuels_prices=[price.text for price in pokhara_fuels_prices]
        for fuel,price in zip(pokhara_fuels,pokhara_fuels_prices):
            pkh_data.update({fuel:price})
        __Thankot=main.find_all('div',{'class':'carousel-item'})[2]
        places_thankot=__Thankot.find_all('h6',{'class':'text-center'})[0].text
        thankot_fuels=__Thankot.find_all('h6',{'class':'text-center text-muted font-small'})
        thankot_fuels_prices=__Thankot.find_all('h5',{'class':'text-center primary-color-text'})
        thankot_fuels=[fuel.text for fuel in thankot_fuels]
        thankot_fuels_prices=[price.text for price in thankot_fuels_prices]
        for fuel,price in zip(thankot_fuels,thankot_fuels_prices):
            thk_data.update({fuel:price})
        fuel_data={places_mahendranagar:mhng_data,places_pokhara:pkh_data,places_thankot:thk_data}
        return fuel_data


