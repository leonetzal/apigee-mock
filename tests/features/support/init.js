'use strict';

const apickli = require('apickli');

const { Before, setDefaultTimeout } = require('cucumber');

Before(function () {
    this.apickli = new apickli.Apickli('http', '');
    this.apickli.addRequestHeader('Cache-Control', 'no-cache');
    this.apickli.setGlobalVariable('apigeeDomain', 'localhost:9000');
    this.apickli.setGlobalVariable('deploymentSuffix', 'web/v1/posts');
});

setDefaultTimeout(60 * 1000); // this is in ms