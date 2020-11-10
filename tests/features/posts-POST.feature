Feature: /posts/post POST

    Insertar los posts en el Sitio Web.

    Scenario: /post 201 created.

        Given I set Content-Type header to application/json
        And I set body to {"titulo": "Title","cuerpo": "Body"}
        When I POST to `apigeeDomain`/`deploymentSuffix`/post

        Then response code should be 201
        And response body should be valid json

        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.resultado.idPost should be ^([0-9])*$

    Scenario: /post 400 bad request.

        Given I set Content-Type header to application/json
        And I set body to {"titulo": "Title","cuerpo": null}
        When I POST to `apigeeDomain`/`deploymentSuffix`/post

        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be ^400\.Sitio-Web\.\d{4}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.detalles[*] should be ([A-Za-z])+.\w+

    Scenario: /post 500 internal server error.

        Given I set Content-Type header to application/json
        And I set body to {"titulo": null,"cuerpo": null}
        When I POST to `apigeeDomain`/`deploymentSuffix`/post

        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be ^500\.Sitio-Web\.\d{4}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.detalles[*] should be ([A-Za-z])+.\w+