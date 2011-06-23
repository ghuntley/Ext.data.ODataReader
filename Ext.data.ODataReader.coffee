# JsonReader by default expects and only works with an 
# javascript array[] of objects()
#
# This reader does NOT require the usual "root" {param}
# to be specified upon instantiation, instead it is 
# automagically determined when reading the data.
#
# The API GetOne() method returns an collection of JSON 
# objects() which breaks Ext.data.JsonReader.
#
# getOne() returns:
#    d: {
#          xxx: yyyy
#          xxx: yyyy
#          xxx: yyyy
#    }
# 
# The API GetAll() method returns an array[] of JSON
# objects().
#
# getAll() returns:
#    d: {
#       results: [{
#          xxx: yyyy
#          xxx: yyyy
#          xxx: yyyy
#       },
#       {
#          xxx: yyyy
#          xxx: yyyy
#          xxx: yyyy
#       }]
#    }
#

Ext.data.ODataReader = Ext.extend Ext.data.JsonReader,

    extractData: (root, returnRecords) ->
        recordName = @record
        data = []

        if root.d?
            if root.d.results?
                data = root.d['results']
            else
                data.push root.d
        else
            data = root

        return Ext.data.ODataReader.superclass.extractData.call(this, data, returnRecords)

Ext.data.ReaderMgr.registerType 'odata', Ext.data.ODataReader


