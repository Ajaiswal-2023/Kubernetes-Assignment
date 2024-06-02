exports.success = (res, data) => {
    res.status(200).json({ success: true, data });
  };
  
  exports.error = (res, message, status = 500) => {
    res.status(status).json({ success: false, message });
  };
  