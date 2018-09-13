import { Component } from '@angular/core';
import { TestService } from './test.service';
import { LoginService } from './login.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private testService: TestService, private auth: LoginService) {}

  triggerEndpoint() {
    this.testService.test().subscribe((response) => {
      console.log(response);
    });
  }

  defaultLogin() {
    this.auth.login({ username: 'admin', password: 'admin', rememberMe: false}).then((response) => {
      console.log(response);
    }).catch((error) => {
      console.log(error);
    });
  }
}
