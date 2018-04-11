import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';

import { SERVER_API_URL } from '../../app.constants';
import { User } from '..';

@Injectable()
export class TestService {
    private resourceUrl = SERVER_API_URL + 'microservice/api/test';

    constructor(private http: HttpClient) { }

    test(): Observable<HttpResponse<String>> {
        return this.http.get<String>(this.resourceUrl, { observe: 'response' });
    }
}
