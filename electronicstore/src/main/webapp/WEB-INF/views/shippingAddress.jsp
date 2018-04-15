<div class="container">
<center><h1>Enter Shipping Address</h1></center>
<form action="${contextRoot}/user/addAddress">
<div class="form-group">
    <label for="inputAddress">Address 1</label>
    <input type="text" class="form-control" name="address1" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" name="address2" placeholder="Main St landmark">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" name="city">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select name="state" class="form-control">
        <option value="Andra Pradesh">Andra Pradesh</option>
        <option value="Delhi">Delhi</option>
        <option value="Karnataka">Karnataka</option>
        <option selected value="Maharashtra">Maharashtra</option>
        <option value="Uttar Pradesh">Uttar Pradesh</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" name="zip">
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>