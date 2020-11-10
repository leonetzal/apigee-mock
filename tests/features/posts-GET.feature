Feature: /posts/get GET

    Consultar los posts en el Sitio Web.

    Scenario: /get 200 ok.

        When I GET `apigeeDomain`/`deploymentSuffix`/get

        Then response code should be 200
        And response body should be valid json

        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.resultado.posts[*].idPost should be ^([0-9])*$
        And response body path $.resultado.posts[*].titulo should be ([A-Za-z])+.\w+
        And response body path $.resultado.posts[*].cuerpo should be ([A-Za-z])+.\w+