# Instagram Trending Data Scraper - MERN Stack

यह एक पूर्ण MERN Stack application है जो Instagram से trending data को scrape करती है और CSV file में save करती है। यह scraper automatically हर 1 घंटे में run होता है।

## 🚀 Features

- ✅ Instagram trending posts को automatically scrape करना
- ✅ Data को MongoDB में save करना
- ✅ Data को CSV file में save करना
- ✅ हर 1 घंटे में automatic scraping (Cron Job)
- ✅ Manual scraping का option
- ✅ Beautiful React frontend dashboard
- ✅ CSV file download करने की सुविधा
- ✅ Real-time statistics

## 📁 Project Structure

```
instagram-scraper-mern/
├── backend/
│   ├── models/
│   │   └── TrendingData.js       # MongoDB Schema
│   ├── routes/
│   │   └── api.js                # API Routes
│   ├── services/
│   │   └── scraper.js            # Instagram Scraper Service
│   ├── data/                     # CSV files storage
│   ├── .env                      # Environment variables
│   ├── server.js                 # Main server file
│   └── package.json
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── App.js               # Main React component
│   │   ├── App.css              # Styles
│   │   ├── index.js
│   │   └── index.css
│   └── package.json
└── README.md
```

## 🛠️ Technologies Used

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB** - Database
- **Mongoose** - ODM
- **Puppeteer** - Web scraping
- **node-cron** - Task scheduling
- **csv-writer** - CSV file creation

### Frontend
- **React.js** - UI library
- **Axios** - HTTP client
- **React Icons** - Icons

## 📋 Prerequisites

सिस्टम में ये चीज़ें installed होनी चाहिए:

- Node.js (v14 या उससे ऊपर)
- MongoDB (v4.4 या उससे ऊपर)
- npm या yarn

## 🔧 Installation & Setup

### 1. Repository Clone करें

```bash
git clone <repository-url>
cd instagram-scraper-mern
```

### 2. Backend Setup

```bash
cd backend

# Dependencies install करें
npm install

# .env file को configure करें (already created)
# MongoDB URI और अन्य settings check करें

# MongoDB start करें (अलग terminal में)
mongod

# Backend server start करें
npm start
# या development mode के लिए
npm run dev
```

Backend server `http://localhost:5000` पर run होगा।

### 3. Frontend Setup

```bash
cd frontend

# Dependencies install करें
npm install

# Development server start करें
npm start
```

Frontend `http://localhost:3000` पर open होगा।

## 🌐 API Endpoints

### GET `/api/trending`
सभी scraped trending posts fetch करें
```json
{
  "success": true,
  "count": 10,
  "data": [...]
}
```

### POST `/api/scrape-now`
Manual scraping trigger करें
```json
{
  "success": true,
  "message": "Scraping completed successfully",
  "count": 10,
  "data": [...]
}
```

### GET `/api/download-csv`
CSV file download करें

### GET `/api/stats`
Scraping statistics देखें
```json
{
  "success": true,
  "stats": {
    "totalPosts": 50,
    "latestScrapeTime": "2024-02-13T10:30:00.000Z",
    "csvPath": "./data/instagram_trending.csv"
  }
}
```

## ⏰ Cron Job Schedule

Scraper automatically हर घंटे run होता है। Schedule को modify करने के लिए `backend/server.js` में cron expression बदलें:

```javascript
// Current: हर घंटे
cron.schedule('0 * * * *', async () => {
  // scraping code
});

// Examples:
// '*/30 * * * *'  - हर 30 मिनट में
// '0 */2 * * *'   - हर 2 घंटे में
// '0 9 * * *'     - हर दिन सुबह 9 बजे
```

## 📊 CSV File Format

CSV file में ये columns होंगे:

- Username
- Post URL
- Caption
- Likes
- Comments
- Hashtags
- Image URL
- Scraped At

## 🎨 Frontend Features

- **Dashboard**: सभी trending posts की grid view
- **Statistics**: Total posts और last scrape time
- **Actions**: 
  - Manual scraping
  - CSV download
  - Data refresh
- **Post Cards**: हर post का detailed view with likes, comments, hashtags

## ⚠️ Important Notes

### Instagram Scraping Limitations

1. **Authentication Required**: Instagram requires login for most content. इस demo में sample data generate होता है।

2. **Instagram Graph API**: Production के लिए Instagram Graph API का उपयोग करें:
   - Business account की ज़रूरत है
   - Access token required
   - API rate limits apply

3. **Terms of Service**: Instagram की Terms of Service को follow करें।

### Production में Deploy करने के लिए:

1. Environment variables properly set करें
2. MongoDB Atlas जैसी cloud database का उपयोग करें
3. Instagram Graph API implement करें
4. Rate limiting add करें
5. Error handling improve करें
6. Logging system add करें

## 🔐 Environment Variables

Backend `.env` file में ये variables हैं:

```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/instagram-scraper
SCRAPE_INTERVAL=3600000
CSV_FILE_PATH=./data/instagram_trending.csv
```

## 🚀 Running in Production

```bash
# Backend
cd backend
npm start

# Frontend build
cd frontend
npm run build

# Frontend को serve करने के लिए
npx serve -s build
```

## 📝 To-Do / Future Enhancements

- [ ] Instagram Graph API integration
- [ ] User authentication
- [ ] Multiple hashtag support
- [ ] Advanced filtering options
- [ ] Data visualization charts
- [ ] Email notifications
- [ ] Docker containerization
- [ ] CI/CD pipeline

## 🤝 Contributing

Contributions welcome हैं! Please feel free to submit a Pull Request.

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

Created with ❤️ for learning purposes

## 📧 Support

किसी भी issue या query के लिए, issue create करें या contact करें।

---

**Note**: यह project educational purposes के लिए है। Production में use करने से पहले Instagram की policies और API guidelines को ज़रूर पढ़ें।
