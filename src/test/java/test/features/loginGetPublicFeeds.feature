Feature:Login And Get Public Feeds
  Background:
    * url getUri

  Scenario: Login And Get Public Feeds
    Given path '/Auth/Login'
    * header Content-Type = 'application/x-www-form-urlencoded; charset=UTF-8'
    * header Referer = 'https://www.nesine.com/'
    And request 'i=NESİNECOMKADİ&pw=NESİNECOMSİFRE&rme=false&rn=532963'
    When method post
    Then status 200
    And print response
    * string setCookie = responseHeaders['Set-Cookie']
    Given path '/sharing/getpublicfeeds'
    And request 'action=getpublicfeeds&username=uyeRWVLMNJXV3LWP&order=desc&orderby=CreateDate.Ticks&timebycomparedirection=gt&timebycomparevalue=0&pagesize=0&page=1&fid=&datatype=json&rnd=726026'
    * configure cookies = null
    * string setCookie = setCookie.replace("]", '')
    * string setCookie = setCookie.replace("[", '')
    * string setCookie = setCookie.replaceAll("\"", '')
    * string setCookie = setCookie.replaceAll('secure', '')
    * string setCookie = setCookie.replaceAll(',', '')
    * header cookie = setCookie
    When method post
    Then status 200
    And match response.totalitemcount == 100