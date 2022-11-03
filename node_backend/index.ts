import express, { Application, Request, Response } from 'express'
import { PrismaClient } from '@prisma/client'

const app: Application = express()
const prisma = new PrismaClient()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

const port: number = 3000

app.get('/api/studies', async (req: Request, res: Response) => {
  try {
    const allStudies = await prisma.$queryRaw`SELECT * FROM getallstudies();`
    return res.json({
      success: true,
      data: allStudies
    })
  } catch (error) {
    return res.json({
      success: false,
      message: error
    })
  }
})

app.get('/api/courses', async (req: Request, res: Response) => {
  try {
    const allCourses = await prisma.$queryRaw`
    SELECT
      C.title AS "courseTitle",
      T.title AS "themeTitle",
      L.title AS "lessonTitle",
      L.description AS "lessonDescription",
      S."finishedLesson",
      CAST(S.id as BOOLEAN) AS "isStudying"
    FROM "Course" C
    INNER JOIN "Theme" T ON T."courseId" = C.id
    INNER JOIN "Lesson" L ON L."themeId" = T.id
    LEFT JOIN "Study" S ON S."lessonId" = L.id;
    `
    return res.json({
      success: true,
      data: allCourses
    })
  } catch (error) {
    return res.json({
      success: false,
      message: error
    })
  }
})

app.listen(port, () => {
  console.log(`Server is running on port ${port} `)
})