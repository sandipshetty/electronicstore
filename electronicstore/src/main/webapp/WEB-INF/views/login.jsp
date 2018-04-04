<div class="container" style="padding-top: 10px;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="${contextRoot}/login" method="post">
                            <fieldset>
                            
                                <div class="form-group">
                                    <input class="form-control" placeholder="User Name" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <a href="${contextRoot}/forgetpassword">Forget Password</a>
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                              <input type="submit"   class="btn btn-lg btn-success btn-block" value="Login">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>