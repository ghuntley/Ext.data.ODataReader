(function() {
  Ext.data.ODataReader = Ext.extend(Ext.data.JsonReader, {
    extractData: function(root, returnRecords) {
      var data, recordName;
      recordName = this.record;
      data = [];
      if (root.d != null) {
        if (root.d.results != null) {
          data = root.d['results'];
        } else {
          data.push(root.d);
        }
      } else {
        data = root;
      }
      return Ext.data.ODataReader.superclass.extractData.call(this, data, returnRecords);
    }
  });
  Ext.data.ReaderMgr.registerType('odata', Ext.data.ODataReader);
}).call(this);
