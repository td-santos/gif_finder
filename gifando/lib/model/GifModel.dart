import 'dart:convert';
import 'package:http/http.dart' as http;

class GifModel {
  
  http.Response response;
  
  

  getGifs(String categoria,int offSet ,{int limit =14}) async {
    print("categoria" + categoria);
    response = await http.get(
        "https://api.giphy.com/v1/gifs/search?api_key=N1xFHJSIJW0L4xATq7QDiTDWscvZ4vFo&q=" +
            categoria.toString() +
            "&limit="+limit.toString()+"&offset=" +
            offSet.toString() +//"14" +
            "&rating=G&lang=en");
    return json.decode(response.body);
    print(response.body);
  }

 
}

