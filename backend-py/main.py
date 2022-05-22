
from fastapi import FastAPI,Path,Body
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from cores.scrapper import get_data


app=FastAPI()


@app.post('/e48eb50c-c328-11ec-afa9-5a66ba053ac0',response_class=JSONResponse)
async def main():
    data=await get_data()
    return data


# test endpoint for evaluation



@app.get('/test',reponse_class=JSONResponse)
async def test_func():
    data={"message":"Hello working fine"}
    return data