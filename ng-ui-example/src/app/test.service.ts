import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';

import { Observable } from 'rxjs';

@Injectable({providedIn: 'root'})
export class TestService {
    private resourceUrl = 'microservice/api/test';

    constructor(private http: HttpClient) { }

    test(): Observable<HttpResponse<String>> {
        return this.http.get<String>(this.resourceUrl, { observe: 'response' });
    }
}
